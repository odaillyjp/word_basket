module WordBasket
  require 'moji'
  require 'unf'

  class Word
    attr_reader :name, :head, :last

    def initialize(name)
      @name = name
      @head = Word.convert_head_index(name)
      @last = Word.convert_last_index(name)
    end

    private

    def self.convert_head_index(name)
      convert_char_index(name[0])
    end

    def self.convert_last_index(name)
      convert_char_index(name[-1])
    end

    def self.convert_char_index(char)
      remove_dakuten(Moji.kata_to_hira(char))
    end

    def self.remove_dakuten(char)
      char.to_nfd.split('').first
    end
  end
end
