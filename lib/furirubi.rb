require 'furirubi/version'
require 'furirubi/translators/jisho_web_translator'

module Furirubi
  def self.translator
    @translator ||= Furirubi::Translators::JishoWebTranslator.new
  end

  def self.translator=(trans)
    @translator = trans
  end

  def self.parse(search_term)
    words = translator.translate(search_term)
  end
end
