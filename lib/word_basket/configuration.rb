module WordBasket
  class Configuration
    attr_reader :database

    def initialize(*)
      database ||= 'firebase'

      configure_database(database)
    end

    private

    # db_nameで指定したデータベースを使用可能な状態にする
    def configure_database(database_name)
      require("word_basket/database/#{database_name}.rb")
      @database = WordBasket::Database.const_get(database_name.classify).new
    rescue
      # TODO: エラー処理
      raise SettingError, 'データベースの設定に失敗しました。'
    end

    class SettingError < StandardError; end
  end
end
