module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      'uid' => ENV['spotify_mock_user_uid'] || 'mockuser',
      'credentials' => {
        'token' => ENV['spotify_mock_user_token'],
        'refresh_token' => ENV['spotify_mock_user_refresh_token'],
        'expires_at' => Time.now + 1.hour
      }
    })
  end
end
