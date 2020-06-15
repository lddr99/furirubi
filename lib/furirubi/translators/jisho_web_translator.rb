require 'erb'
require 'open-uri'
require 'uri'
require 'nokogiri'

module Furirubi
  module Translators
    class JishoWebTranslator
      URL = 'https://jisho.org/search/'.freeze

      # @tricky: the flag is using to force-change the word to sentence
      def translate(search_term, flag = 'flag')
        words = {}
        uri = URI.join(URL, ERB::Util.url_encode(search_term + flag))

        elements = Nokogiri::HTML.parse(open(uri)).css('.japanese_word')
        elements.each do |element|
          result = parse_element(element, flag)
          words.merge!(result) unless result.nil?
        end

        words
      end

      private

      def parse_element(element, flag)
        # parse furigana
        if element.search('.japanese_word__furigana').size.positive?
          furigana_elements = element.search('.japanese_word__furigana')
          return parse_furigana_elements(furigana_elements)
        end

        # parse kana or symbol
        parse_general_text(element, flag)
      end

      def parse_furigana_elements(elements)
        words = {}

        elements.each do |el|
          if el.attr('data-text').empty?
            words[el.text] = ''
            next
          end

          words[el.attr('data-text')] = el.text
        end

        words
      end

      def parse_general_text(element, flag)
        # parse kana
        text = element.search('.japanese_word__text_wrapper a').text

        # parse symbol
        text = element.search('.japanese_word__text_wrapper').text if text.empty?

        { text => '' } if text != flag
      end
    end
  end
end
