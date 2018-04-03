require 'rails_helper'

describe CbsService do

  describe "players" do
    it "gets all players" do
      VCR.use_cassette("services/get_players") do
        players = CbsService.get_players
        player = players[4]

        expect(players.count).to eq(9096)
        expect(players).to be_an(Array)
        expect(player).to be_a(Hash)
        expect(player).to have_key(:photo)
        expect(player).to have_key(:eligible_for_offense_and_defense)
        expect(player).to have_key(:position)
        expect(player).to have_key(:icons)
        expect(player).to have_key(:lastname)
        expect(player).to have_key(:age)
        expect(player).to have_key(:elias_id)
        expect(player).to have_key(:pro_status)
        expect(player).to have_key(:bats)
        expect(player).to have_key(:jersey)
        expect(player).to have_key(:fullname)
        expect(player).to have_key(:throws)
        expect(player).to have_key(:pro_team)
      end
    end
    it "gets all positions" do
      VCR.use_cassette("services/get_players") do
        positions = CbsService.get_positions
        position = positions.first
        expect(positions).to be_an(Array)
        expect(position).to be_a(Hash)
        expect(position).to have_key(:position)
      end
    end
  end
end
