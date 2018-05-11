require 'rails_helper'

context 'When a user visits a playlist URL' do
  scenario 'they can see the songs in it' do
    user = mock_user
    user.save!

    playlist = user.playlists.second
    tracks = playlist.tracks
    visit '/'
    mock_auth_hash
    click_on 'Login with Spotify'

    visit "/playlists/#{playlist.id}"

    within('#tracks') do
      tracks.each do |track|
        expect(page).to have_content(track.name)
        expect(page).to have_content(track.artists.first.name)
      end
    end
  end
end
