module WordBasket
  require 'moji'
  require 'unf'

  class Word
    attr_reader :name, :head, :last

    def initialize(name)
      @name = name
      @head = fetch_head(name)
      @last = fetch_last(name)
    end

    private

    def fetch_head(name)
      convert_char_index(name[0])
    end

    def fetch_last(name)
      convert_char_index(name[-1])
    end

    def convert_char_index(char)
      remove_dakuten(Moji.kata_to_hira(char))
    end

    def remove_dakuten(char)
      char.to_nfd.split('').first
    end
  end
end
