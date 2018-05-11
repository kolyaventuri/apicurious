require 'rails_helper'

describe 'Javascript Token Fetch endpoint' do
  it 'should return the users token when logged in' do
    user = mock_user
    user.save!

    visit '/'
    mock_auth_hash
    click_on 'Login with Spotify'

    visit '/api/v1/my/token'

    data = JSON.parse(page.body, symbolize_names: true)

    expect(data[:token]).to_not be_nil
  end
end
