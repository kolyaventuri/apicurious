module MockUserTokens
  def mock_user
    User.new(
      :uid=>"kolyaventuri",
      token: ENV['spotify_mock_user_token'],
      refresh_token: ENV['spotify_mock_user_refresh_token'],
      token_expires: DateTime.now + 1.hour
    )
  end
end
