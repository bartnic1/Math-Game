class Player
  attr_reader :name, :tries
  # Tries should be an integer
  def initialize(player_name, tries)
    @name = player_name
    @tries = tries
  end

  def reduce_tries
    @tries -= 1
  end

  def no_tries?
    @tries == 0
  end
end