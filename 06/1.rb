def get_position(char, array_of_arrays)
  position = []
  array_of_arrays.each_with_index do |row, y|
    row.each_with_index do |el, x|
      if el == char
        position = [x, y]  
        break
      end
    end
    break unless position.empty?
  end
  position
end

def get_next_point(current_position, direction)
  next_point = []
  case direction
  when "up"
    next_point = [current_position[0], current_position[1] - 1]
  when "down"
    next_point = [current_position[0], current_position[1] + 1]
  when "left"
    next_point = [current_position[0] - 1, current_position[1]]
  when "right"
    next_point = [current_position[0] + 1, current_position[1]]
  end
  next_point
end

def point_exist_in_tab?(dimensions_of_tab, coordinates_of_point)
  return false if coordinates_of_point[0] < 0 || coordinates_of_point[1] < 0
  return false if coordinates_of_point[0] >= dimensions_of_tab[0] || coordinates_of_point[1] >= dimensions_of_tab[1]
  true
end

def is_wall?(point)
  point == "#"
end

def change_direction(direction)
  case direction
  when "up"
    "right"
  when "right"
    "down"
  when "down"
    "left"
  when "left"
    "up"
  end
end


# lines = File.readlines('example.txt').map { |line| line.chomp.split('') }
lines = File.readlines('input.txt').map { |line| line.chomp.split('') }

current_position = get_position("^", lines)
dimensions_of_tab = [lines[0].size, lines.size]
direction = "up"

while true
  next_point = get_next_point(current_position, direction)

  break if !point_exist_in_tab?(dimensions_of_tab, next_point)

  if is_wall?(lines[next_point[1]][next_point[0]])
    direction = change_direction(direction)  # Change direction
  else
    current_position = next_point
    lines[current_position[1]][current_position[0]] = "X"  # Mark the position as X
  end
end

p lines
X_count = lines.flatten.count("X")
puts "The robot has visited #{X_count} positions"