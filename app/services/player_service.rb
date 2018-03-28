class PlayerService

  def initialize
    @conn = Faraday.new(:url => 'http://api.cbssports.com')
  end

  def self.get_players
    PlayerService.new.get_players
  end

  def get_players
    baseball = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'baseball', :response_format => 'JSON' })
    football = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'football', :response_format => 'JSON' })
    basketball = get_url('/fantasy/players/list', { :version => '3.0', :SPORT => 'basketball', :response_format => 'JSON' })
    add_sport_column(baseball, 'baseball')
    add_sport_column(football, 'football')
    add_sport_column(basketball, 'basketball')
    all_players = baseball + football + basketball
    delete_id_column(all_players)
  end

  private

  def get_url(url, params)
    response = @conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)[:body][:players]
  end

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

end
