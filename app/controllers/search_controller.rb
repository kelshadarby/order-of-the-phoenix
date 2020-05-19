class SearchController < ApplicationController
  def index
    search_results = SearchResults.new
    @order_of_phoenix_members = search_results.order_of_phoenix_members(params[:house])
  end
end
