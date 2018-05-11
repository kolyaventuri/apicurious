class Playlist
  attr_reader :id, :uri, :name, :tracks_uri, :track_count, :owner

  def initialize(playlist_data, spotify)
    @id = playlist_data[:id]
    @uri = playlist_data[:uri]
    @name = playlist_data[:name].gsub(/[^\s!-~]/i,'').strip
    @tracks_uri = playlist_data[:tracks][:href]
    @track_count = playlist_data[:tracks][:total]
    @owner = SpotifyUser.new(playlist_data[:owner])

    @spotify = spotify
  end

  def tracks
    playlist_tracks = @spotify.make_request("users/#{@owner.id}/playlists/#{@id}")
    playlist_tracks[:tracks][:items].map do |track_data|
      binding.pry
      Track.new(track_data)
    end
  end
end
