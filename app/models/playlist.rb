class Playlist
  attr_reader :id, :uri, :name, :tracks_uri, :track_count, :owner

  def initialize(playlist_data)
    @id = playlist_data[:id]
    @uri = playlist_data[:uri]
    @name = playlist_data[:name]
    @tracks_uri = playlist_data[:tracks][:href]
    @track_count = playlist_data[:tracks][:total]
    @owner = nil
  end
end
