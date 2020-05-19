require "rails_helper"

describe SearchResults do
  before :each do
    json_response = File.read('spec/fixtures/order_of_the_phoenix.json')
    stub_request(:get, "https://www.potterapi.com/v1/characters?house=Gryffindor&key=#{ENV['HARRY_POTTER_API_KEY']}&orderOfThePhoenix=true").
      to_return(status: 200, body: json_response)
  end
  it "#order_of_phoenix_members" do
    search_results = SearchResults.new
    gryffindor_members = search_results.phoenix_order_members("Gryffindor")

    ron = gryffindor_members.last

    expect(ron).to be_a Member
    expect(ron.name).to eq("Ronald Weasley")
    expect(ron.role).to eq("student")
    expect(ron.house).to eq("Gryffindor")
    expect(ron.patronus).to eq("jack russell terrier")
  end
end
