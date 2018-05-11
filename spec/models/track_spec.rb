require 'rails_helper'

describe Track do
  before(:all) do
    @data = {:added_at=>"2014-10-15T02:16:59Z",
 :added_by=>{:external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri"}, :href=>"https://api.spotify.com/v1/users/kolyaventuri", :id=>"kolyaventuri", :type=>"user", :uri=>"spotify:user:kolyaventuri"},
 :is_local=>false,
 :primary_color=>nil,
 :track=>
  {:album=>
    {:album_type=>"album",
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
     :uri=>"spotify:album:39vpWS7vrC4Pz33bNafjva"},
   :artists=>
    [{:external_urls=>{:spotify=>"https://open.spotify.com/artist/3dRfiJ2650SZu6GbydcHNb"},
      :href=>"https://api.spotify.com/v1/artists/3dRfiJ2650SZu6GbydcHNb",
      :id=>"3dRfiJ2650SZu6GbydcHNb",
      :name=>"John Williams",
      :type=>"artist",
      :uri=>"spotify:artist:3dRfiJ2650SZu6GbydcHNb"},
     {:external_urls=>{:spotify=>"https://open.spotify.com/artist/5yxyJsFanEAuwSM5kOuZKc"},
      :href=>"https://api.spotify.com/v1/artists/5yxyJsFanEAuwSM5kOuZKc",
      :id=>"5yxyJsFanEAuwSM5kOuZKc",
      :name=>"London Symphony Orchestra",
      :type=>"artist",
      :uri=>"spotify:artist:5yxyJsFanEAuwSM5kOuZKc"}],
   :available_markets=>[],
   :disc_number=>1,
   :duration_ms=>22693,
   :episode=>false,
   :explicit=>false,
   :external_ids=>{:isrc=>"USSM10411556"},
   :external_urls=>{:spotify=>"https://open.spotify.com/track/6lLu8tQeIjMCHyDPo1DRrA"},
   :href=>"https://api.spotify.com/v1/tracks/6lLu8tQeIjMCHyDPo1DRrA",
   :id=>"6lLu8tQeIjMCHyDPo1DRrA",
   :is_local=>false,
   :name=>"20th Century Fox Fanfare",
   :popularity=>0,
   :preview_url=>nil,
   :track=>true,
   :track_number=>1,
   :type=>"track",
   :uri=>"spotify:track:6lLu8tQeIjMCHyDPo1DRrA"},
 :video_thumbnail=>{:url=>nil}}
  end

  it 'should represent a single track' do
    track = Track.new(@data)

    expect(track.id).to eq(@data[:track][:id])
    expect(track.name).to eq(@data[:track][:name])
    expect(track.local?).to eq(@data[:track][:is_local])
    expect(track.artists).to be_an Array
    expect(track.artists.first).to be_an Artist
    expect(track.artists.first.name).to eq(@data[:track][:artists].first[:name])
    expect(track.album).to be_an Album
  end
end
