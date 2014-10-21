require 'word_basket/word'
require 'word_basket/configuration'
require 'active_support/core_ext/string'

module WordBasket
  def self.configuration
    @configuration ||= WordBasket::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
    configuration.setting
  end
end
