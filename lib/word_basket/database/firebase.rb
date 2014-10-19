module WordBasket
  module Database
    require 'firebase'
    require 'uri'

    class Firebase
      ROOT_NAME = 'words'
      BASE_URL  = "https://#{ENV['FIREBASE_APP_NAME']}.firebaseio.com/"

      def initialize
        @client = ::Firebase::Client.new(BASE_URL)
      end

      def set(data)
        response = @client.set(generate_path(data), data)
        response.success?
      end

      def sample(data)
        @words ||= @client.get(ROOT_NAME).body
        return if @words[data.head].nil? || @words[data.head][data.last].nil?
        @words[data.head][data.last].values.sample['name']
      end

      private

      def generate_path(data)
        path = [ROOT_NAME, data.head, data.last, data.name].join('/')
        URI.escape(path)
      end
    end
  end

  Word.class_eval do
    def to_json
      "{ \"name\": \"#{@name}\", \"furigana\": \"#{@furigana}\" }"
    end
  end
end
