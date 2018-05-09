class Spotify
  API_URL = "https://api.spotify.com/v1/"
  
  def initialize(user)
    @user = user
  end

  def self.from_user(user)
    new(user)
  end

  def check_token
    now = DateTime.now
    @user.token_expires > now
  end

  def refresh_token
    return if check_token

  end

  def make_request(endpoint, parameters)
    conn = Faraday::new(url: "#{API_URL}#{endpoint}?#{parameters.to_query}")

    response = conn.get

    JSON.parse(response.body, symbolize_names: true)
  end
end
