require 'rails_helper'

describe SpotifyUser do
  it 'should represent a spotify user' do
    data = {
      :display_name=>nil,
      :external_urls=>{:spotify=>"https://open.spotify.com/user/kolyaventuri"},
      :href=>"https://api.spotify.com/v1/users/kolyaventuri",
      :id=>"kolyaventuri",
      :type=>"user",
      :uri=>"spotify:user:kolyaventuri"
    }

    user = SpotifyUser.new(data)

    expect(user.display_name).to eq(data[:display_name])
    expect(user.href).to eq(data[:href])
    expect(user.external_href).to eq(data[:external_urls][:spotify])
    expect(user.id).to eq(data[:id])
    expect(user.type).to eq(data[:type])
    expect(user.uri).to eq(data[:uri])
  end
end
