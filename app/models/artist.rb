class Artist
  attr_reader :id, :name, :href

  def initialize(artist_data)
    @id = artist_data[:id]
    @name = artist_data[:name]
    @href = artist_data[:href]
  end
end
