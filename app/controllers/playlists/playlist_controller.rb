class Playlists::PlaylistController < ApplicationController
  def show
    @playlist = current_user.playlists.select do |playlist|
      playlist.id == params[:id]
    end.first

    return redirect_to root_path if @playlist.nil?

    @tracks = @playlist.tracks
  end


  def create
    current_user.create_playlist(params[:name])
    redirect_to root_path
  end
end
