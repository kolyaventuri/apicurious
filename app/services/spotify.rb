class Spotify
  def self.check_token(user)
    now = DateTime.now
    user.token_expires > now
  end
end
