class Player 
    attr_reader :token #Changed to att_reader as it cant be changed once assigned
    
    def initialize(token) #accepts a token to assign
        @token = token
    end


end
