require 'word_basket/word'
require 'word_basket/configuration'
require 'active_support/core_ext/string'

module WordBasket
  def self.config
    @database ||= WordBasket::Configuration.new
  end
end
