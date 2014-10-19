module WordBasket
  require 'moji'
  require 'unf'
  require 'ostruct'

  class Word
    attr_reader :name, :furigana, :head, :last

    # class methods

    def self.create(name)
      word = Word.new(name)
      word.save
      word
    end

    def self.sample(query)
      name = WordBasket.config.database.sample(OpenStruct.new(query))
      Word.new(name) if name
    end

    # instance methods

    def initialize(name, furigana = nil)
      @name     = name
      @furigana = furigana || name
      @head     = convert_head_index(@furigana)
      @last     = convert_last_index(@furigana)
    end

    def save
      WordBasket.config.database.set(self)
    end

    private

    def convert_head_index(furigana)
      convert_char_index(furigana[0])
    end

    def convert_last_index(furigana)
      convert_char_index(furigana[-1])
    end

    def convert_char_index(char)
      remove_dakuten(Moji.kata_to_hira(char))
    end

    def remove_dakuten(char)
      char.to_nfd.split('').first
    end
  end
end
