class SearchController < ApplicationController
  def index
    search_hash =  {
      type: 'track',
      q: search_params['query'].strip
    }

    @tracks = current_user.spotify.make_request('search', search_hash)[:tracks][:items]

    @tracks = @tracks.map do |track|
      Track.new({track: track})
    end
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end
