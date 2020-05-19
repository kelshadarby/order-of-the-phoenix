class SearchResults
  def order_of_phoenix_members(house)
    json = HogwartsService.new.order_of_phoenix_members(house)

    @order_of_phoenix_members = json.map do |member_info|
      Member.new(member_info)
    end
  end
end
