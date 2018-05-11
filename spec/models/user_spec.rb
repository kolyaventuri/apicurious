require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_presence_of(:refresh_token) }
  it { is_expected.to validate_presence_of(:token_expires) }

  context 'Spotify data' do
    it 'is expected to have a PlaylistCollection' do
      user = mock_user
      user.save!

      expect(user.playlists).to be_a PlaylistCollection
    end
  end
end
