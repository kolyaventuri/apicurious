require 'rails_helper'

describe 'As a user' do
  scenario 'I can search for a song' do
    user = mock_user
    user.save!

    visit '/'
    mock_auth_hash
    click_on 'Login with Spotify'

    song = 'All Star'
    page.driver.post("/do/search?search[query]=#{song}")

    expect(page).to have_content(song)
  end
end
