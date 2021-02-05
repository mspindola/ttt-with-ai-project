class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [ 
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ] #    defines a constant WIN_COMBINATIONS with arrays for each win combination

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
    ##method above and attr accessors provides access to board, player 1 and 2 and initializes 2 players with x and o and empty board

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2 
    end
    #returns the correct player, X, for the third move
    
    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
      end
    end
    #   returns false for a draw/returns the correct winning combination in the case of a win/isn't hard-coded 
    def draw?
      @board.full? && !won?
    end
    # returns false for a draw, correct winning combo in case of win, not hard coded
  
    def over?
        won? || draw?
    end 
    # returns true for a draw, true for a won game, false for in progress game

    def winner
        if winning_combo = won?
            @winner = @board.cells[winning_combo.first]
        end
    end
    #return x when x won || returns O when O won, returns nil when no winner

    def turn
        player = current_player
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
          turn
        else
          puts "Turn: #{@board.turn_count+1}\n"
          @board.display
          @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
          @board.display
          puts "\n\n"
        end
    end
    #method above makes valid moves/asksd for input again after a failed validation/changes to player 2 after the first run

    def play 
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    # #asks for players input on a turn of the game
    # checks if the game is over after every turn
    # plays the first turn of the game
    # plays the first few turns of the game
    # checks if the game is won after every turn
    # checks if the game is a draw after every turn
    # stops playing if someone has won
    # congratulates the winner X
    # congratulates the winner O
    # stops playing in a draw
    # prints "Cat's Game!" on a draw
    # plays through an entire game

    
end