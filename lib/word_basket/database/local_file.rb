module WordBasket
  module Database
    require 'json'

    class LocalFile
      attr_accessor :storage_path

      DEFAULT_FILE_NAME = 'words.json'

      def initialize
        @storage_path = File.expand_path("../../../../db/#{DEFAULT_FILE_NAME}")
        @words = load_storage_file
      end

      def set(data)
        return if @words.any? { |word| word['name'] == data.name }

        @word.push(data.to_h)
        File.open(storage_path, 'w') { |file| file.write(@words.to_json) }
      end

      def sample(data)
        words = @words.select { |word| word['head'] == data.head && word['last'] == data.last }

        return nil if words.empty?
        words.sample['name']
      end

      private

      def load_strorage_file
        File.exist?(storage_path) ? JSON.parse(File.read(storage_path)) : []
      end
    end
  end

  Word.class_eval do
    def to_h
      { 'name' => @name, 'furigana' => @furigana, 'head' => @head, 'last' => @last }
    end
  end
end
