  task get_data: :environment do
    Position.get_all
    puts 'created new position objects'
    Player.get_all
    puts 'created new player objects'
    Position.average_age_for_position
    puts 'computed average age for each position'
  end
