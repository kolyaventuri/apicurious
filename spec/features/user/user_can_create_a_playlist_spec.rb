require 'rails_helper'

context 'When a user is on the website' do
  context 'and they try to create a new playlist' do
    scenario 'a new playlist is created' do
      user = mock_user
      user.save!

      visit '/'
      mock_auth_hash
      click_on 'Login with Spotify'

      fill_in 'name', with: 'An Incredible New Playlist'
      click_on 'Create Playlist'

      expect(page).to have_content('An Incredible New Playlist')
    end
  end
end
