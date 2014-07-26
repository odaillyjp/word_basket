module WordBasket
  require 'moji'
  require 'unf'

  class Word
    attr_reader :name, :head, :last

    # class methods

    class << self
      def create(name)
        word = Word.new(name)
        #database.set(word)
        word
      end

      def convert_head_index(name)
        convert_char_index(name[0])
      end

      def convert_last_index(name)
        convert_char_index(name[-1])
      end

      private

      def convert_char_index(char)
        remove_dakuten(Moji.kata_to_hira(char))
      end

      def remove_dakuten(char)
        char.to_nfd.split('').first
      end
    end

    # instance methods

    def initialize(name)
      @name = name
      @head = Word.convert_head_index(name)
      @last = Word.convert_last_index(name)
    end

    def to_json
      data = instance_variables.map do |variable|
        "\"#{variable[1..-1]}\":\"#{instance_variable_get(variable)}\""
      end

      "{#{data.join(',')}}"
    end
  end
end
