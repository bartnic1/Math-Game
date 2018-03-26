class TurnManager
  def initialize(players)
    @players = players.shuffle
  end

  def current_player
    @players.first
  end

  def next_turn
    @players.rotate!
  end
end