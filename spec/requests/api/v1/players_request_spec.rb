require 'rails_helper'

describe "Players API" do
  it "can get one player by its id" do
    position = Position.create(name: 'SP', average_age_for_position: 24)

    raw_player = {
      firstname:"Albert",
      photo: "http://sports.cbsimg.net/images/players/unknown-hat-170x170.png",
      eligible_for_offense_and_defense: 0,
      position_id: position.id,
      lastname: "Abreu",
      age: 22,
      elias_id: "ABR645995",
      pro_status: "A",
      bats: "R",
      jersey: "87",
      fullname: "Albert Abreu",
      throws: "R",
      pro_team: "NYY",
      sport: "baseball"
    }

    id = Player.create(raw_player).id
    get "/api/v1/players/#{id}"

    player = JSON.parse(response.body)
    expect(response).to be_success
    expect(player["id"]).to eq(id)
    expect(player["name_brief"]).to eq("A. A.")
    expect(player["first_name"]).to eq("Albert")
    expect(player["last_name"]).to eq("Abreu")
    expect(player["position"]).to eq("SP")
    expect(player["age"]).to eq(22)
    expect(player["average_position_age_diff"]).to eq(-2)
  end
end
