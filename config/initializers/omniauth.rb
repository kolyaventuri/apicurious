keys = Rails.application.secrets

scopes = [
  'playlist-modify-public',
  'playlist-read-private',
  'user-read-private',
  'user-read-email',
  'user-modify-playback-state',
  'streaming'
]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
    ENV['spotify_client_id'],
    ENV['spotify_client_secret'],
    scope: scopes.join(' ')
end
