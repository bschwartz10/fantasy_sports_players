require 'rails_helper'

describe Player do
  it "it should return a baseball players info" do
    position = Position.create(name: 'SP')

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

    player = Player.create(raw_player)

    expect(player.firstname).to eq("Albert")
    expect(player.photo).to eq("http://sports.cbsimg.net/images/players/unknown-hat-170x170.png")
    expect(player.eligible_for_offense_and_defense).to eq(0)
    expect(player.position_id).to eq(position.id)
    expect(player.lastname).to eq("Abreu")
    expect(player.age).to eq(22)
    expect(player.elias_id).to eq("ABR645995")
    expect(player.pro_status).to eq("A")
    expect(player.bats).to eq("R")
    expect(player.jersey).to eq("87")
    expect(player.fullname).to eq("Albert Abreu")
    expect(player.throws).to eq("R")
    expect(player.pro_team).to eq("NYY")
    expect(player.sport).to eq("baseball")
  end

  it "it should return a football players info" do
    position = Position.create(name: 'RB')
    raw_player = {
      bye_week:"7,18,19,20,21",
      firstname: "Ameer",
      photo: "http://sports.cbsimg.net/images/football/nfl/players/170x170/1824308.png",
      eligible_for_offense_and_defense: 0,
      position_id: position.id,
      lastname: "Abdullah",
      age: 24,
      elias_id: "ABD647726",
      pro_status: "A",
      jersey: "21",
      fullname: "Ameer Abdullah",
      pro_team: "DET",
      sport: "football"
}

    player = Player.create(raw_player)

    expect(player.bye_week).to eq("7,18,19,20,21")
    expect(player.firstname).to eq("Ameer")
    expect(player.photo).to eq("http://sports.cbsimg.net/images/football/nfl/players/170x170/1824308.png")
    expect(player.eligible_for_offense_and_defense).to eq(0)
    expect(player.position_id).to eq(position.id)
    expect(player.lastname).to eq("Abdullah")
    expect(player.age).to eq(24)
    expect(player.elias_id).to eq("ABD647726")
    expect(player.pro_status).to eq("A")
    expect(player.jersey).to eq("21")
    expect(player.fullname).to eq("Ameer Abdullah")
    expect(player.pro_team).to eq("DET")
    expect(player.sport).to eq("football")
  end

  it "it should return a basketball players info" do
    position = Position.create(name: 'SF')
    raw_player = {
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

    player = Player.create(raw_player)
    expect(player.firstname).to eq("Quincy")
    expect(player.photo).to eq("http://sports.cbsimg.net/images/basketball/nba/players/170x170/1992779.png")
    expect(player.eligible_for_offense_and_defense).to eq(0)
    expect(player.position_id).to eq(position.id)
    expect(player.lastname).to eq("Acy")
    expect(player.age).to eq(27)
    expect(player.elias_id).to eq("ACY029662")
    expect(player.pro_status).to eq("A")
    expect(player.jersey).to eq("13")
    expect(player.fullname).to eq("Quincy Acy")
    expect(player.pro_team).to eq("BKN")
    expect(player.sport).to eq("basketball")
  end

end
