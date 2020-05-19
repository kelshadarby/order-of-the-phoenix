class HogwartsService
  def order_of_phoenix_members(house)
    params = {
        key: ENV['HARRY_POTTER_API_KEY'],
        orderOfThePhoenix: true,
        house: house
      }
    get_json("/v1/characters", params)

  end

  private

    def get_json(url, params)
      response = conn.get(url, params)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://www.potterapi.com")
    end
end
