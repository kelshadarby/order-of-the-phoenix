class SearchResults
  def order_of_phoenix_members(house)
    json = HogwartsService.new.order_of_phoenix_members_by_house(house)

    json.map do |member_info|
      Member.new(member_info)
    end
  end
end
