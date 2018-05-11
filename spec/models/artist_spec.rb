require 'rails_helper'

describe Artist do
  before(:all) do
    @data = {:external_urls=>{:spotify=>"https://open.spotify.com/artist/3dRfiJ2650SZu6GbydcHNb"},
      :href=>"https://api.spotify.com/v1/artists/3dRfiJ2650SZu6GbydcHNb",
      :id=>"3dRfiJ2650SZu6GbydcHNb",
      :name=>"John Williams",
      :type=>"artist",
      :uri=>"spotify:artist:3dRfiJ2650SZu6GbydcHNb"}
  end

  it 'should represent an artist' do
    artist = Artist.new(@data)

    expect(artist.id).to eq(@data[:id])
    expect(artist.name).to eq(@data[:name])
    expect(artist.href).to eq(@data[:href])
  end
end
