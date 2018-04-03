require 'rails_helper'

describe "Sports Football API" do
  it "can return a collection of football players" do
    position_one = Position.create(name: 'WR', average_age_for_position: 24)
    position_two = Position.create(name: 'RB', average_age_for_position: 27)

    raw_player_one = {
      bye_week: "8,18,19,20,21",
      firstname: "Davante",
      photo: "http://sports.cbsimg.net/images/football/nfl/players/170x170/1893167.png",
      eligible_for_offense_and_defense: 0,
      position_id: position_one.id,
      lastname: "Adams",
      age: 25,
      elias_id: "ADA218591",
      pro_status: "A",
      jersey: "17",
      fullname: "Davante Adams",
      id: "1893167",
      pro_team: "GB",
      sport: "football"
    }

    raw_player_two = {
      bye_week:"7,18,19,20,21",
      firstname: "Ameer",
      photo: "http://sports.cbsimg.net/images/football/nfl/players/170x170/1824308.png",
      eligible_for_offense_and_defense: 0,
      position_id: position_two.id,
      lastname: "Abdullah",
      age: 24,
      elias_id: "ABD647726",
      pro_status: "A",
      jersey: "21",
      fullname: "Ameer Abdullah",
      pro_team: "DET",
      sport: "football"
    }

    Player.create(raw_player_one)
    Player.create(raw_player_two)

    get "/api/v1/sports/football"

    players = JSON.parse(response.body)

    expect(response).to be_success
    expect(players).to be_a(Array)
    expect(players.count).to eq(2)
    expect(players.first).to be_a(Hash)
  end
end
