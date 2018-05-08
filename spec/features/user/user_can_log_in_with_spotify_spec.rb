require 'rails_helper'

describe 'A user visiting the homepage' do
  scenario 'can sign in with Spotify' do
    visit root_path

    expect(page).to have_content('Login with Spotify')
    mock_auth_hash

    
    click_link 'Login with Spotify'

    expect(page).to have_content('mockuser')
  end
end
