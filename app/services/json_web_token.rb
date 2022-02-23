module JsonWebToken
  class Encoder
    SECRET_KEY = ENV['SECRET_KEY_BASE']

    def self.encode(playload, exp = 24.hours.from_now)
      playload[:exp] = exp.to_i
      JWT.encode(playload, SECRET_KEY)
    end

    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
