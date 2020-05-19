require "rails_helper"

describe Member do
  it "is initialized" do
    attributes = {
      name: "Aberforth Dumbledore",
      role: "Owner, Hog's Head Inn",
      house: "Gryffindor",
      patronus: "goat"
    }

    dumbledore = Member.new(attributes)

    expect(dumbledore).to be_a Member
    expect(dumbledore.name).to eq("Aberforth Dumbledore")
    expect(dumbledore.role).to eq("Owner, Hog's Head Inn")
    expect(dumbledore.house).to eq("Gryffindor")
    expect(dumbledore.patronus).to eq("goat")
  end
end
