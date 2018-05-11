class Album
  attr_reader :id,
    :name,
    :artwork,
    :artists

  def initialize(album_data)
    @id = album_data[:id]
    @name = album_data[:name]
    @artwork = album_data[:images].first[:url]

    @artists = album_data[:artists].map { |artist| Artist.new(artist) }
  end
end
