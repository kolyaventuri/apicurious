class PlaylistCollection < Array
  def self.from_spotify(spotify)
    new(spotify)
  end

  private
  def initialize(spotify)
    playlists = spotify.make_request('me/playlists')

    unless playlists[:items].nil?
      playlists[:items].each do |playlist|
        self << Playlist.new(playlist)
      end
    end
  end
end
