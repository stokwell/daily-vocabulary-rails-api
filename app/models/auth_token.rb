class AuthToken
  def self.key
    Rails.application.secrets.secret_key_base
  end

  def self.verify(token)
    result = JWT.decode(token, key, false)
    User.find_by(id: result[0]["user_id"])
  end
end
