require 'rails_helper'

describe "Sports Basketball API" do
  it "can return a collection of basketball players" do
      raw_player_one = {
        firstname: "Quincy",
        photo: "http://sports.cbsimg.net/images/basketball/nba/players/170x170/1992779.png",
        eligible_for_offense_and_defense: 0,
        position: "SF",
        lastname: "Acy",
        age: 27,
        elias_id: "ACY029662",
        pro_status: "A",
        jersey: "13",
        fullname: "Quincy Acy",
        pro_team: "BKN",
        sport: "basketball"
      }

      raw_player_two = {
        firstname: "Andrew",
        photo: "http://sports.cbsimg.net/images/basketball/nba/players/170x170/2135571.png",
        eligible_for_offense_and_defense: 0,
        position: "SG",
        lastname: "Wiggins",
        age: 23,
        elias_id: "WIG405166",
        pro_status: "A",
        jersey: "22",
        fullname: "Andrew Wiggins",
        pro_team: "MIN",
        sport: "basketball"
      }

    Player.create(raw_player_one)
    Player.create(raw_player_two)

    get "/api/v1/sports/basketball"

    players = JSON.parse(response.body)

    expect(response).to be_success
    expect(players).to be_a(Array)
    expect(players.count).to eq(2)
    expect(players.first).to be_a(Hash)
  end
end
