class User < ApplicationRecord
  validates_presence_of :uid
  validates_presence_of :token
  validates_presence_of :refresh_token
  validates_presence_of :token_expires

  attr_reader :playlists

  after_initialize do
    spotify = Spotify::from_user(self)
    @playlists = PlaylistCollection::from_spotify(spotify)
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user| 
      new_user.uid = auth_info.uid
      new_user.token = auth_info.credentials.token
      new_user.refresh_token = auth_info.credentials.refresh_token
      new_user.token_expires = Time.at(auth_info.credentials.expires_at).to_datetime
    end
  end
end
