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
        path = URI.escape("#{ROOT_NAME}/#{data.head}/#{data.last}")
        response = @client.set(path, data)
        response.success?
      end
    end
  end

  Word.class_eval do
    def to_json
      "{ \"#{@name}\": \"#{@name}\" }"
    end
  end
end
