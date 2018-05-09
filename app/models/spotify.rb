require 'base64'

class Spotify
  API_URL = "https://api.spotify.com/v1/"
  B64_AUTH = Base64.strict_encode64("#{ENV['spotify_client_id']}:#{ENV['spotify_client_secret']}")

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

  def refresh_token(force=false)
    return if check_token && !force

    conn = Faraday::new('https://accounts.spotify.com/api/token')
    
    response = conn.post do |req|
      req.headers['Authorization'] = "Basic #{B64_AUTH}"

      req.body = {
        grant_type: 'refresh_token',
        refresh_token: @user.refresh_token
      }
    end

    data = JSON.parse(response.body, symbolize_names: true)
    @user.token = data[:access_token]
    @user.refresh_token = data[:refresh_token] unless data[:refresh_token].nil?
    @user.token_expires = DateTime.now + data[:expires_in].seconds
    @user.save!
  end

  def make_request(endpoint, parameters)
    @user.reload
    refresh_token
    conn = Faraday::new(url: "#{API_URL}#{endpoint}?#{parameters.to_query}")

    response = conn.get do |req|
      req.headers['Authorization'] = "Bearer #{@user.token}"
    end

    data = JSON.parse(response.body, symbolize_names: true)
    unless data[:error].nil?
      if data[:error][:status] == 401
        refresh_token(true)
        return make_request(endpoint, parameters)
      end
    end

    data
  end
end
