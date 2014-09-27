module WordBasket
  module Database
    require 'firebase'

    class Firebase
      BASE_URL = "https://#{ENV['FIREBASE_APP_NAME']}.firebaseio.com/"

      def initialize
        @client = ::Firebase::Client.new(BASE_URL)
      end

      def set(data)
        response = @client.set('words', data)
        response.success?
      end
    end
  end

  Word.class_eval do
    def to_json
      "{ \"#{@head}\": { \"#{@last}\": { \"name\": \"#{@name}\" }}}"
    end
  end
end
