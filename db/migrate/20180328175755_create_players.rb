class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :photo
      t.integer :eligible_for_offense_and_defense
      t.string :position
      t.text   :icons
      t.string :lastname
      t.integer :age
      t.string :elias_id
      t.string :pro_status
      t.string :bats
      t.string :jersey
      t.string :fullname
      t.string :throws
      t.string :pro_team
      t.string :bye_week
      t.string :sport
    end
  end
end
