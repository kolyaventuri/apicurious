class Track
  attr_reader :artists, :id, :name, :album, :uri
  def initialize(track_data)
    data = track_data[:track]
    
    @artists = data[:artists].map { |artist| Artist.new(artist) }
    @id = data[:id]
    @name = data[:name]
    @uri = data[:uri]
    @local = data[:is_local]
    @album = Album.new(data[:album])
  end

  def local?
    @local
  end
end
