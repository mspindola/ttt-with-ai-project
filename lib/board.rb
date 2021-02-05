class Board
    attr_accessor :cells #has an attribute to store the cells of the board

    def initialize()  #sets the cells of the board to a 9 element array of " "
        reset!
    end
    
    def reset! #Can reset the state of ells in the board & sets the cells of the board to a 9 element array
        @cells = [" "," "," "," "," "," "," "," "," ",]
    end

    def display #prints the board
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input) #takes user input and retuns the value of the board cell
      cells[input.to_i-1]
    end

    def full? #returns true for a full board, false for in-progress game
      cells.all?{|i| i == "X" || i == "O"}
    end

    def turn_count #returns the amount of cturns based on cell value
      cells.count{|i| i == "X" || i == "O"}
    end

    def taken?(input) #Board #taken? returns true if the position is X or O
      !(position(input) == " " || position(input) ==  " ")
    end

    def valid_move?(input) #returns true for user input between 1-9 that is not taken 
      input.to_i.between?(1,9) && !taken?(input)
    end

    def update(input, player) #updates the cells in the board with the player token according to the input 
      cells[input.to_i-1] = player.token
    end
end
