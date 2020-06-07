class Board

    attr_reader :size

    def self.print_grid(grid)

        grid.each do | row |

            puts row.join(" ")

        end

    end

    def initialize(num)

        @grid = Array.new(num) { Array.new(num, :N) }

        @size = num * num

    end

    def [](position)

        @grid[position[0]][position[1]]

    end

    def []=(position, val)

        @grid[position[0]][position[1]] = val

    end

    def num_ships

        @grid.flatten.count { | ele | ele == :S }

    end

    def attack(position)

        if self[position] == :S

            self[position] = :H

            puts "you sunk my battleship"

            return true

        else

            self[position] = :X

            return false

        end

    end

    def place_random_ships

        random_ships = @size / 4

        length = Integer.sqrt(@size)

        while self.num_ships < random_ships
            
            random_index_1 = Random.new.rand(length - 1)
            random_index_2 = Random.new.rand(length - 1)
            
            self[[random_index_1, random_index_2]] = :S
            
        end

    end

    def hidden_ships_grid

        @grid.map do | row |

            row.map do | ele |
                
                if ele == :S
                    
                    :N

                else

                    ele

                end

            end

        end

    end

    def cheat

        Board.print_grid(@grid)

    end

    def print

        Board.print_grid(self.hidden_ships_grid)

    end
  
end
