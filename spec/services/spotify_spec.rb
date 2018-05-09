require 'rails_helper'

describe 'Spotify Wrapper' do
  before(:each) do
    DatabaseCleaner.clean
    @user = mock_user
    @user.save!
    @spoti_user = Spotify::from_user(@user)
  end

  describe 'token validation' do
    it 'should know that user does not need refresh' do
      result = @spoti_user.check_token

      expect(result).to eq(true)
    end

    it 'should know that user needs refresh' do
      @user.token_expires = DateTime.now - 1.hour
      @user.save!

      result = @spoti_user.check_token

      expect(result).to eq(false)
    end

    it 'should skip refresh when not needed' do
      @user.token_expires = DateTime.now + 1.hour
      @user.save!

      @spoti_user = Spotify::from_user(@user)
      @spoti_user.refresh_token

      expect(User.first.token).to eq(@user.token)
    end

    xit 'should refresh when needed' do
      @user = mock_user
      @user.token_expires = DateTime.now - 1.hour
      @user.save!

      @spoti_user = Spotify::from_user(user)
      @spoti_user.refresh_token

      expect(User.first.token).to_not eq(@user.token)
    end
  end

  describe 'API calls' do
    it 'should be able to make an API call' do
      result = @spoti_user.make_request('search', {q: 'charly bliss', type: 'track'})

      expect(result).to be_instance_of(Hash)
      expect(result[:tracks]).to_not be_nil
      expect(result[:tracks][:items]).to be_instance_of(Array)
    end
  end
end
