require 'furirubi/version'
require 'furirubi/translators/jisho_web_translator'
require 'furirubi/formators/ruby_html'

module Furirubi
  def self.translator
    @translator ||= Furirubi::Translators::JishoWebTranslator.new
  end

  def self.translator=(trans)
    @translator = trans
  end

  def self.formator
    @formator ||= Formators::RubyHtml.new
  end

  def self.formator=(format)
    @formator = format
  end

  def self.parse(search_term)
    words = translator.translate(search_term)
    words[search_term] = '' if words.size.zero?

    formator.format(words)
  end
end
