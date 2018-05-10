class Playlist
  attr_reader :id, :uri, :name, :tracks_uri, :track_count, :owner

  def initialize(playlist_data)
    @id = playlist_data[:id]
    @uri = playlist_data[:uri]
    @name = playlist_data[:name].gsub(/[^\s!-~]/i,'').strip
    @tracks_uri = playlist_data[:tracks][:href]
    @track_count = playlist_data[:tracks][:total]
    @owner = SpotifyUser.new(playlist_data[:owner])
  end
end
