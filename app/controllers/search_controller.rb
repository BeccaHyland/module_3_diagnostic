class SearchController < ApplicationController
  def index
    @search_result = StationSearchResult.new(params[:zip])
  end
end
