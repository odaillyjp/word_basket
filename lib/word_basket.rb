# Ruby Core Extensions
require 'word_basket/core_ext/string'
require 'active_support/core_ext/string'

# Liblary
require 'moji'
require 'unf'
require 'ostruct'

# WordBasket Liblary
require 'word_basket/word'
require 'word_basket/configuration'
require 'word_basket/controller'

module WordBasket
  APP_ROOT = File.expand_path('../', __dir__)

  def self.configuration
    @configuration ||= WordBasket::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
    configuration.setting
  end
end
