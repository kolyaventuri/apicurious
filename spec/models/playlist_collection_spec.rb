require 'rails_helper'

describe PlaylistCollection do
  before(:all) do
    user = mock_user
    user.save!

    spotify = Spotify::from_user(user)
    @playlist_collection = PlaylistCollection::from_spotify(spotify)
  end

  it 'should function like an array' do
    expect(@playlist_collection).to be_a_kind_of Array
  end

  it 'should have a collection of Playlist objects' do
    expect(@playlist_collection.length).to be > 0
    @playlist_collection.each do |playlist|
      expect(playlist).to be_a Playlist
    end
  end
end
