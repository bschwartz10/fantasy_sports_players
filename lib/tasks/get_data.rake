  task get_player_data: :environment do
    Player.get_all
    puts 'created new player objects'
  end
