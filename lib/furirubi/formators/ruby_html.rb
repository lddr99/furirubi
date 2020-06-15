module Formators
  class RubyHtml
    def format(words)
      ruby_elements = words.map do |key, value|
        value.empty? ? key : "<ruby>#{key}<rt>#{value}</rt></ruby>"
      end

      ruby_elements.join
    end
  end
end
