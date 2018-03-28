class Player < ApplicationRecord
  serialize :icons
  scope :has_age_and_position, -> { where.not(age: nil).where.not(position: "") }

   def self.get_all
     PlayerService.get_players.map do |raw_player|
       Player.create(raw_player)
     end
   end

   def average_age_for_position(position)
     age = Player.has_age_and_position.where(position: position).average(:age)
     age.to_f if age
   end


end
