class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def move

    if @direction == 'N'
      @y_coordinate += 1
      # @y_coordinate = y_coordinate + 1
    elsif @direction == 'S'
      @y_coordinate -= 1
    elsif @direction == 'E'
      @x_coordinate += 1
    elsif @direction == 'W'
      @x_coordinate -= 1
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
        self.move
      elsif value == "L" || value == "R"
        self.turn(value)
      else
        puts "I don't understand the command"
      end
    end
  end
end

puts "What is the starting position x-coordinate?"
x_start = gets.chomp
puts "what is the starting position y-coordinate?"
y_start = gets.chomp
puts "what direction is the Rover facing? N S E W"
direction = gets.chomp
puts "How should the Rover travel the plateau? 'L' turn left 'R' turn right 'M' move forward:"
instructions = gets.chomp
array_instructions = instructions.split(//)

n_rover = Rover.new(x_start.to_i, y_start.to_i, direction)
n_rover.read_instruction(array_instructions)
puts "New Position:\nx-coordinate: #{n_rover.x_coordinate}\ny-coordinate: #{n_rover.y_coordinate}\nDirection: #{n_rover.direction}"
