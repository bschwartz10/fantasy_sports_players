require 'rails_helper'

describe "Sports Baseball API" do
  it "can return a collection of baseball players" do
      raw_player_one = {
        firstname:"Albert",
        photo: "http://sports.cbsimg.net/images/players/unknown-hat-170x170.png",
        eligible_for_offense_and_defense: 0,
        position: "SP",
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

      raw_player_two = {
        firstname: "Austin",
        photo: "http://sports.cbsimg.net/images/players/unknown-hat-170x170.png",
        eligible_for_offense_and_defense: 0,
        position: "RP",
        icons: {
        headline: "Nationals' Austin Adams: Sent down Saturday"
        },
        lastname: "Adams",
        age: 26,
        elias_id: "ADA102540",
        pro_status: "M",
        bats: "R",
        jersey: "70",
        fullname: "Austin Adams",
        id: "2444539",
        throws: "R",
        pro_team: "WAS",
        sport: "baseball"
      }

    Player.create(raw_player_one)
    Player.create(raw_player_two)

    get "/api/v1/sports/baseball"

    players = JSON.parse(response.body)

    expect(response).to be_success
    expect(players).to be_a(Array)
    expect(players.count).to eq(2)
    expect(players.first).to be_a(Hash)
  end
end
