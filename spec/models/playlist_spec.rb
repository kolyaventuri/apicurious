require 'rails_helper'

describe Playlist do
  it 'should be able to store playlist data' do
    data = {:collaborative=>false,
      :external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri/playlist/4IAgx6wtEAi4St03d50b17"},
      :href=>"https://api.spotify.com/v1/users/kolyaventuri/playlists/4IAgx6wtEAi4St03d50b17",
      :id=>"4IAgx6wtEAi4St03d50b17",
      :images=>[],
      :name=>"New Playlist",
      :owner=>
      {:display_name=>nil,
        :external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri"},
        :href=>"https://api.spotify.com/v1/users/kolyaventuri",
        :id=>"kolyaventuri",
        :type=>"user",
        :uri=>"spotify:user:kolyaventuri"},
      :primary_color=>nil,
      :public=>true,
      :snapshot_id=>"B7P98A7pr1FRNCMCqMOI0RedhkIBufm8ufCWoWCfW0Dys/d42nVL39YUHjo/DiBv",
      :tracks=>{:href=>"https://api.spotify.com/v1/users/kolyaventuri/playlists/4IAgx6wtEAi4St03d50b17/tracks", :total=>88},
      :type=>"playlist",
      :uri=>"spotify:user:kolyaventuri:playlist:4IAgx6wtEAi4St03d50b17"}

    playlist = Playlist.new(data)

    expect(playlist.id).to eq(data[:id])
    expect(playlist.snapshot_id).to eq(data[:snapshot_id])
  end
end
