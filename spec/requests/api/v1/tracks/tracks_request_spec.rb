require 'rails_helper'

describe 'Tracks API Request' do
  context 'When a user requests a specific playlist' do
    it 'should return a list of tracks for that playlist' do
      user = mock_user
      user.save!

      playlist = user.playlists.second

      tracks = playlist.tracks

      get "/api/v1/playlist/#{playlist.id}/tracks"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_an Array
      track_ids = tracks.map(&:id)
      requested_ids = data.map { |track| track[:id] }

      track_ids.each do |id|
        expect(requested_ids).to include(id)
      end
    end
  end
end
