def count_valid_arrays(arrays)
  arrays.count do |array|
    valid_array_with_removal?(array)
  end
end

def valid_array_with_removal?(array)

  return true if valid_array?(array)

  array.each_with_index do |_, index|
    reduced_array = array[0...index] + array[index + 1..-1]
    return true if valid_array?(reduced_array)
  end
  false
end

def valid_array?(array)
  direction = nil
  (0...array.size - 1).each do |i|
    diff = array[i + 1] - array[i]
    return false if diff.abs < 1 || diff.abs > 3 
    return false if direction && ((direction == :increasing && diff < 0) || (direction == :decreasing && diff > 0))

    direction ||= diff > 0 ? :increasing : :decreasing
  end

  true
end


# arrays = [
#   [7, 6, 4, 2, 1], # valid (no violations)
#   [1, 2, 7, 8, 9], # valid (remove 7, becomes [1, 2, 8, 9])
#   [9, 7, 6, 2, 1], # invalid (even after removal, cannot become valid)
#   [1, 3, 2, 4, 5], # valid (remove 2, becomes [1, 3, 4, 5])
#   [8, 6, 4, 4, 1], # valid (remove one 4, becomes [8, 6, 4, 1])
#   [1, 3, 6, 7, 9]  # valid (no violations)
# ]

arrays = File.readlines('input.txt').map { |line| line.split.map(&:to_i) }
puts count_valid_arrays(arrays) 
