class Track
  attr_reader :artists, :id, :name, :album
  def initialize(track_data)
    data = track_data[:track]
    
    @artists = data[:artists].map { |artist| artist[:name] }
    @id = data[:id]
    @name = data[:name]
    @local = data[:is_local]
    
  end

  def local?
    @local
  end
end
