require 'rails_helper'

describe Playlist do
  before(:all) do
    @data = {:collaborative=>false,
 :external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri/playlist/76NrhvQ3GrzVCJr9DdLwy8"},
 :href=>"https://api.spotify.com/v1/users/kolyaventuri/playlists/76NrhvQ3GrzVCJr9DdLwy8",
 :id=>"76NrhvQ3GrzVCJr9DdLwy8",
 :images=>
  [{:height=>640, :url=>"https://mosaic.scdn.co/640/63a08944cd6c495902b69d7d8288d1858df2f672888abe4a03e235829ef0929c0d0503fdc1a05448bb38bc41222e7d1aa1ebf2e14f20a5806efd0065dbaf1c621295103d19d919285e79a4315f4ad52e", :width=>640},
   {:height=>300, :url=>"https://mosaic.scdn.co/300/63a08944cd6c495902b69d7d8288d1858df2f672888abe4a03e235829ef0929c0d0503fdc1a05448bb38bc41222e7d1aa1ebf2e14f20a5806efd0065dbaf1c621295103d19d919285e79a4315f4ad52e", :width=>300},
   {:height=>60, :url=>"https://mosaic.scdn.co/60/63a08944cd6c495902b69d7d8288d1858df2f672888abe4a03e235829ef0929c0d0503fdc1a05448bb38bc41222e7d1aa1ebf2e14f20a5806efd0065dbaf1c621295103d19d919285e79a4315f4ad52e", :width=>60}],
 :name=>"My Favourite Movie Songs",
 :owner=>{:display_name=>nil, :external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri"}, :href=>"https://api.spotify.com/v1/users/kolyaventuri", :id=>"kolyaventuri", :type=>"user", :uri=>"spotify:user:kolyaventuri"},
 :primary_color=>nil,
 :public=>true,
 :snapshot_id=>"sFSMx+nTwHRA/RCRCOHw3ebJQVyqZ04RKiu3+dy15xV4fFjx8EsA1wL1impSdzVJ",
 :tracks=>{:href=>"https://api.spotify.com/v1/users/kolyaventuri/playlists/76NrhvQ3GrzVCJr9DdLwy8/tracks", :total=>25},
 :type=>"playlist",
 :uri=>"spotify:user:kolyaventuri:playlist:76NrhvQ3GrzVCJr9DdLwy8"}

    user = mock_user
    user.save!

    @spotify = Spotify::from_user(user)
  end
  
  it 'should be able to store playlist data' do
    playlist = Playlist.new(@data, @spotify)

    expect(playlist.id).to eq(@data[:id])
    expect(playlist.uri).to eq(@data[:uri])
    expect(playlist.name).to eq(@data[:name])
    expect(playlist.tracks_uri).to be(@data[:tracks][:href])
    expect(playlist.track_count).to be(@data[:tracks][:total])
    expect(playlist.owner).to be_a SpotifyUser
  end

  it 'should be able to load tracks' do
    playlist = Playlist.new(@data, @spotify)

    expect(playlist.tracks).to be_an Array

    playlist.tracks.each do |track|
      expect(track).to be_a Track
    end
  end
end
