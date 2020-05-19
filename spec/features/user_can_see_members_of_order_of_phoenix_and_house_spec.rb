require "rails_helper"

RSpec.describe "As a user" do
  before :each do
    json_response = File.read('spec/fixtures/order_of_the_phoenix.json')
    stub_request(:get, "https://www.potterapi.com/v1/characters?house=Gryffindor&key=#{ENV['HARRY_POTTER_API_KEY']}&orderOfThePhoenix=true").
      to_return(status: 200, body: json_response)
  end
  it "I can see order of the phoenix members who are Gryffindor's" do
    visit '/'

    select "Gryffindor", from: :house

    click_on "Search For Members"

    expect(current_path).to eq('/search')

    expect(page).to have_content("21 Results")
    expect(page).to have_css(".member_of_order_of_the_phoenix", count: 21)

    within(first(".member_of_order_of_the_phoenix")) do
     expect(page).to have_css(".name")
     expect(page).to have_css(".role")
     expect(page).to have_css(".house")
     expect(page).to have_css(".patronus")
   end
  end
end
