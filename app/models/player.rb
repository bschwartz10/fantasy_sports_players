class Player < ApplicationRecord
  serialize :icons
  belongs_to :position

  # Create players with positions
  def self.get_all
    CbsService.get_players.map do |raw_player|
      Position.all.each do |position|
        if position.name == raw_player[:position]
          raw_player.delete(:position)
          position.players.create(raw_player)
        end
      end
    end
  end

end
