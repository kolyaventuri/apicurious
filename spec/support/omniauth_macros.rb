module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      'uid' => 'mockuser',
      'credentials' => {
        'token' => 'mock_token',
        'refresh_token' => 'mock_refresh_token',
        'expires_at' => Time.now + 1.hour
      }
    })
  end
end
