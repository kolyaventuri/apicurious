require 'rails_helper'

describe 'Spotify Wrapper' do
  it 'should know that user does not need refres' do
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
end
