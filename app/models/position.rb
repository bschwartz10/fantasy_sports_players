class Position < ApplicationRecord
  has_many :players

  # Create Positions
  def self.get_all
    CbsService.get_positions.map do |position|
      Position.find_or_create_by(name: position[:position])
    end
  end

  #Compute average age for each Position
  def self.average_age_for_position
    Position.all.each do |position|
      position.update(average_age_for_position: position.players.average(:age).to_f)
    end
  end

end
