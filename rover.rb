class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction
  attr_reader :plateau


  def initialize(x_coordinate, y_coordinate, direction, plateau)
    @direction = direction
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @plateau = plateau
  end

  def move

    if @direction == 'N'
      # if @plateau.rover_check == true
        @y_coordinate += 1
      # else
      #   puts "Rover will fall off the edge. Input new instructions"
      #   return
      # end
      # @y_coordinate = y_coordinate + 1
    elsif @direction == 'S'
      # if @plateau.rover_check == true
          @y_coordinate -= 1
      # else
      #   puts "Rover will fall off the edge. Input new instructions"
      #   return
      # end

    elsif @direction == 'E'
      # if @plateau.rover_check == true
        @x_coordinate += 1
      # else
      #   puts "Rover will fall off the edge. Input new instructions"
      #   return
      # end

    elsif @direction == 'W'
      # if @plateau.rover_check == true
        @x_coordinate -= 1
      # else
      #   puts "Rover will fall off the edge. Input new instructions"
      #   return
      # end
    else
      puts "don't understand input"
    end
  end

  def turn(turning)
    if (turning == "L" && @direction == "N") || (turning == "R" && @direction == "S")
      @direction="W"
    elsif (turning == "L" && @direction == "S") || (turning == "R" && @direction == "N")
      @direction="E"
    elsif (turning == "L" && @direction == "E") || (turning == "R" && @direction == "W")
      @direction="N"
    elsif (turning == "L" && @direction == "W") || (turning == "R" && @direction == "E")
      @direction="S"
    else
      puts "i dont understand the command"
    end
  end

  def read_instruction(instruction)

    instruction.map do |value|
      if value == "M"
        if @plateau.rover_check == false
          puts "Rover will fall off the edge"
          return
        else
          self.move
        end

      elsif value == "L" || value == "R"
        self.turn(value)
      else
        puts "I don't understand the command"
      end
    end
  end

  def output
    puts "x_coordinate: #{@x_coordinate}\ny_coordinate: #{@y_coordinate}\ndirection: #{@direction}"
  end

end


class Plateau

  attr_accessor :x_size, :y_size, :rover


  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
    @rover = []
  end

  def add_rover(rovers)
    self.rover.push(rovers)
  end


  def rover_check

    @rover.each_index do |i|
      if (rover[i].x_coordinate.to_i >= x_size || rover[i].y_coordinate.to_i >= y_size) || (rover[i].x_coordinate.to_i <= 0 || rover[i].y_coordinate.to_i <= 0)
        return false
      else
        return true
      end
    end

  end


end


# puts "What is the starting position x-coordinate?"
# x_start = gets.chomp
# puts "what is the starting position y-coordinate?"
# y_start = gets.chomp
# puts "what direction is the Rover facing? N S E W"
# direction = gets.chomp
# n_rover = Rover.new(x_start.to_i, y_start.to_i, direction, plat)
# n_rover.output

plat = Plateau.new(5, 5)
n_rover = Rover.new(1,5,'N', plat)
plat.add_rover(n_rover)
# rover2 = Rover.new(2,5, 'N', plat)
puts "How should the Rover travel the plateau? 'L' turn left 'R' turn right 'M' move forward:"
instructions = gets.chomp
array_instructions = instructions.split(//)
n_rover.read_instruction(array_instructions)
n_rover.output
