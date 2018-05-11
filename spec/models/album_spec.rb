require 'rails_helper'

describe Album do
  before(:all) do
    @data = {:album_type=>"album",
   :artists=>
    [{:external_urls=>{:spotify=>"https://open.spotify.com/artist/3dRfiJ2650SZu6GbydcHNb"},
      :href=>"https://api.spotify.com/v1/artists/3dRfiJ2650SZu6GbydcHNb",
      :id=>"3dRfiJ2650SZu6GbydcHNb",
      :name=>"John Williams",
      :type=>"artist",
      :uri=>"spotify:artist:3dRfiJ2650SZu6GbydcHNb"}],
   :available_markets=>[],
   :external_urls=>{:spotify=>"https://open.spotify.com/album/39vpWS7vrC4Pz33bNafjva"},
   :href=>"https://api.spotify.com/v1/albums/39vpWS7vrC4Pz33bNafjva",
   :id=>"39vpWS7vrC4Pz33bNafjva",
   :images=>
    [{:height=>634, :url=>"https://i.scdn.co/image/e7bd72bfcd78ab91222b1759b70f926ca11e90a0", :width=>640},
     {:height=>297, :url=>"https://i.scdn.co/image/d9140c8d3357cf995131e63b30d81e1fbb59d0f8", :width=>300},
     {:height=>63, :url=>"https://i.scdn.co/image/0742340fd29498b538f2c9590c274d579157be83", :width=>64}],
   :name=>"Star Wars Episode IV: A New Hope (Original Motion Picture Soundtrack)",
   :release_date=>"1997",
   :release_date_precision=>"year",
   :type=>"album",
   :uri=>"spotify:album:39vpWS7vrC4Pz33bNafjva"}
  end

  it 'should represent an album' do
    album = Album.new(@data)

    expect(album.name).to eq(@data[:name])
    expect(album.id).to eq(@data[:id])
    expect(album.artwork).to eq(@data[:images].first[:url])

    expect(album.artists).to be_an Array
    expect(album.artists.first).to be_an Artist
    expect(album.artists.first.name).to eq(@data[:artists].first[:name])
  end
end
