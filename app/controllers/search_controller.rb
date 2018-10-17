class SearchController < ApplicationController
  def index
    binding.pry
    @search_result = StationSearchResult.new(params[:q])
  end
end
