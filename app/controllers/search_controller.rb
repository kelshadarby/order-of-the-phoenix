class SearchController < ApplicationController
  def index
    search_results = SearchResults.new
    @members = search_results.phoenix_order_members(params[:house])
  end
end
