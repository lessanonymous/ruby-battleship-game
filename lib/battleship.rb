require_relative "board"
require_relative "player"

class Battleship

    attr_reader :player, :board

    def initialize(num)

        @player = Player.new
        @board = Board.new(num)
        @remaining_misses = @board.size / 2

    end

    def start_game

        @board.place_random_ships

        puts "Placed ships: #{@board.num_ships}"

        @board.print

    end

    def lose?

        if @remaining_misses < 1

            puts "you lose"

            return true

        else

            return false

        end

    end

    def win?

        if @board.num_ships < 1

            puts "you win"

            return true

        else

            return false

        end

    end

    def game_over?

        if self.lose? || self.win?

            return true

        else

            return false

        end

    end

    def turn

        position = @player.get_move

        @remaining_misses -= 1 if !@board.attack(position)

        @board.print

        puts "Remaining misses #{@remaining_misses}"

    end

end
