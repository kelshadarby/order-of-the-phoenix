require 'rails_helper'

RSpec.describe HogwartsService do
  describe "instance methods" do
    before :each do
      json_response = File.read('spec/fixtures/order_of_the_phoenix.json')
      stub_request(:get, "https://www.potterapi.com/v1/characters?house=Gryffindor&key=#{ENV['HARRY_POTTER_API_KEY']}&orderOfThePhoenix=true").
        to_return(status: 200, body: json_response)
    end
    it "#order_of_phoenix_members_by_house" do
      hogwarts_service = HogwartsService.new
      gryffindor_search = hogwarts_service.order_of_phoenix_members_by_house("Gryffindor")
      expect(gryffindor_search).to be_a Array
      gryffindor_member_data = gryffindor_search.last

      expect(gryffindor_member_data).to have_key :name
      expect(gryffindor_member_data).to have_key :role
      expect(gryffindor_member_data).to have_key :house
      expect(gryffindor_member_data).to have_key :patronus
    end
  end
end
