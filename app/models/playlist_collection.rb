class PlaylistCollection < Array
  def self.from_spotify(spotify)
    new(spotify)
  end

  private
  def initialize(spotify)
  end
end
