module WordBasket
  class Word
    attr_reader :name, :furigana, :head, :last

    # class methods

    def self.create(name, furigana = nil)
      word = Word.new(name, furigana)
      word.save
      word
    end

    def self.sample(query)
      word = WordBasket.configuration.database.sample(OpenStruct.new(query))
      Word.new(word[:name], word[:furigana]) if word
    end

    # instance methods

    def initialize(name, furigana = nil)
      # 振り仮名がNullで、かつ単語名に「ひらがな」「カタカナ」以外が含まれている場合は例外発生
      fail '「振り仮名」が登録されていません。' if furigana.nil? && !name.include_hira_or_kata_only?

      @name     = name
      @furigana = furigana || convert_to_hira(name)
      @head     = remove_dakuten_from_char(@furigana[0])
      @last     = remove_dakuten_from_char(@furigana[-1])
    end

    def save
      WordBasket.configuration.database.set(self)
    end

    private

    def convert_to_hira(str)
      Moji.kata_to_hira(str)
    end

    def remove_dakuten_from_char(char)
      char.to_nfd.split('').first
    end
  end
end
