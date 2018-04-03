class CbsService

  def initialize
    @conn = Faraday.new(:url => 'http://api.cbssports.com')
  end

  def self.get_players
    CbsService.new.get_players
  end

  def self.get_positions
    CbsService.new.get_positions
  end

  # Return a collection of player hashes
  def get_players
    all_players = consume_player_data
    delete_id_column(all_players)
  end

  #Return a collection of position hashes
  def get_positions
    all_players = consume_player_data
    keep_position_info(all_players)
  end

  private


  def consume_player_data
    # Gather player information from three endpoints
    baseball = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'baseball', :response_format => 'JSON' })
    football = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'football', :response_format => 'JSON' })
    basketball = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'basketball', :response_format => 'JSON' })
    # Add corresponding sports column
    add_sport_column(baseball, 'baseball')
    add_sport_column(football, 'football')
    add_sport_column(basketball, 'basketball')
    # Return combined collection
    baseball + football + basketball
  end

  # Helper method to return JSON objects based on url and params
  def get_url(url, params)
    response = @conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)[:body][:players]
  end

  # Delete CBS id column (was confusing database)
  def delete_id_column(players)
    players.map do |player|
      player.delete_if do |key, value|
        key == :id
      end
    end
  end

  def add_sport_column(object, sport)
    object.map do |player|
      player[:sport] = sport
    end
  end

  def keep_position_info(players)
    players.map do |player|
      player.delete_if do |key, value|
        key != :position
      end
    end
  end

end
