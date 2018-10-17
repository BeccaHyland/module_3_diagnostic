class SearchController < ApplicationController
  def index
    @search_result = StationSearchResult.new(params[:q])
  end
end
