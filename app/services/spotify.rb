class Spotify
  def self.check_token(user)
    now = DateTime.now
    user.token_expires > now
  end

  def self.refresh_token(user)
    return if check_token(user)

  end

  def self.make_request(endpoint)
  end
end
