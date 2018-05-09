require 'rails_helper'

describe 'Spotify Wrapper' do
  describe 'token validation' do
    it 'should know that user does not need refresh' do
      user = mock_user
      user.token = 'abc'

      result = Spotify::check_token(user)

      expect(result).to eq(true)
    end

    it 'should know that user needs refresh' do
      user = mock_user
      user.token_expires = DateTime.now - 1.hour

      result = Spotify::check_token(user)

      expect(result).to eq(false)
    end

    it 'should skip refresh when not needed' do
      user = mock_user
      user.token_expires = DateTime.now + 1.hour
      user.save!

      Spotify::refresh_token(user)

      expect(User.first.token).to eq(user.token)
    end

    xit 'should refresh when needed' do
      user = mock_user
      user.token_expires = DateTime.now - 1.hour
      user.save!

      Spotify::refresh_token(user)

      expect(User.first.token).to not_eq(user.token)
    end
  end

  describe 'API calls' do
    it 'should be able to make an API call' do
      result = Spotify::make_request('search')

      expect(result[:tracks]).to_not be_nil
      expect(result[:tracks][:items]).to be_instance_of(Array)
    end
  end
end
