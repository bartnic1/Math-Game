require './player.rb'
require './question_generator.rb'
require './turn_manager.rb'

class Game
  def initialize(tries)
    player1 = Player.new('Player 1', tries)
    player2 = Player.new('Player 2', tries)
    @players = [player1, player2]
    @total_tries = tries
    @turn = TurnManager.new(@players)
    @qgen = Question_generator.new(1,20)
  end

  def game_over?
      @players.any? {|player| player.no_tries?}
  end

  def end_game
    winner = @players.select{|player| player.tries != 0}[0]
    puts "\n----- GAME OVER -----\n#{winner.name} wins with a score of #{winner.tries}/#{@total_tries}\nGood bye!"
  end

  def turn_results(ans, current_player)
    if ans == @qgen.ans
      puts "#{current_player.name}: YES! You are correct."
    else
      puts "#{current_player.name}: Nice try, but you added those numbers wrong"
      current_player.reduce_tries
    end
    puts "P1: #{@players[0].tries}/#{@total_tries} vs P2: #{@players[1].tries}/#{@total_tries}"
  end

  def run
    while !game_over?
      current_player = @turn.current_player
      puts "#{current_player.name}: #{@qgen.new_q}"
      ans = gets.chomp.to_i
      turn_results(ans, current_player)
      @turn.next_turn
      if !game_over?
        puts "\n----- NEW TURN -----"
      end
    end
    end_game
  end
end