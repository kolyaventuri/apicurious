keys = Rails.application.secrets

scopes = [
  'playlist-read-private',
  'user-read-private',
  'user-read-email',
  'user-modify-playback-state'
]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
    keys.spotify['client_id'],
    keys.spotify['client_secret'],
    scope: scopes.join(' ')
end
