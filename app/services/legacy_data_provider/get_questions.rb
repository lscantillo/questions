module LegacyDataProvider
  class GetQuestions
    def initialize(host, username, password)
      con = Mysql2::Client.new(host: host, username: username)
    end
  end
end
