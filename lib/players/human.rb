require 'pry'

module Players #creates module players 
    class Human < Player  #inherits from human ##Players::Human

        def move(board) #asks the user for input and returns it
          puts "Enter your move 1-9:"
          gets.strip
          
        end

    end
end

