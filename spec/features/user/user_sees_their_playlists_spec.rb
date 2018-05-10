require 'rails_helper'

describe 'A user visiting the homepage' do
  scenario 'Sees a list of their playlists' do
    visit root_path
    mock_auth_hash
    click_link 'Login with Spotify'

    user = User.first
    within('#playlists') do
      user.playlists.each do |playlist|
        expect(page).to have_link(playlist.name)
      end
    end
  end
end
