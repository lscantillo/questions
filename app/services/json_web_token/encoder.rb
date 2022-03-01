module JsonWebToken
  class Encoder
    def self.decode(token)
      decoded = JWT.decode(token, nil, false)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
