require 'rails_helper'

describe Position do
  it "it should return a positions info" do
    raw_position = {
      position: "SP"
    }

    position = Position.create(name: raw_position[:position])

    expect(position.name).to eq("SP")
  end

  it "average ages for all positions" do
    raw_position = {
      position: "SP"
    }

    position = Position.create(name: raw_position[:position])

    raw_player_one = {
      firstname: "Quincy",
      photo: "http://sports.cbsimg.net/images/basketball/nba/players/170x170/1992779.png",
      eligible_for_offense_and_defense: 0,
      position_id: position.id,
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
      position_id: position.id,
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
    updated_position = Position.average_age_for_position.first
    expect(updated_position.average_age_for_position).to eq(25)
  end

end
