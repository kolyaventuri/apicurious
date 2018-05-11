class Playlists::PlaylistController < ApplicationController
  def show
    @playlist = current_user.playlists.select do |playlist|
      playlist.id == params[:id]
    end.first

    @tracks = @playlist.tracks
  end
end
