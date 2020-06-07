class Player

    def get_move

        puts "enter a position with coordinates seperated with a space like '4 7'"

        input = gets.chomp

        position = input.split(" ").map { | coordinate | (coordinate.to_i) - 1 }

    end

end
