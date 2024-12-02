# The integers are either all increasing or all decreasing.
# Any two adjacent integers differ by at least one and at most three.
# In the example above, the reports can be found valid or unvalid by checking those rules:

#[ 7, 6, 4, 2, 1]: valid because the integers are all decreasing by 1 or 2.
# [1, 2, 7, 8, 9]: Unvalid because 2 7 is an increase of 5.
# [9, 7, 6, 2, 1]: Unvalid because 6 2 is a decrease of 4.
# [1, 3, 2, 4, 5]: Unvalid because 1 3 is increasing but 3 2 is decreasing.
# [8, 6, 4, 4, 1]: Unvalid because 4 4 is neither an increase or a decrease.
# [1, 3, 6, 7, 9]: valid because the integers are all increasing by 1, 2, or 3.

def count_valid_arrays(arrays)
  arrays.count do |array|
    valid_array?(array)
  end
end

def valid_array?(array)
  direction = nil
  (0...array.size - 1).each do |i|
    diff = array[i + 1] - array[i]

    return false unless (1..3).cover?(diff.abs)
    return false if direction && ((direction == :increasing && diff < 0) || (direction == :decreasing && diff > 0))
    direction ||= diff > 0 ? :increasing : :decreasing
  end
  true
end

# arrays = [
#   [7, 6, 4, 2, 1], # valid
#   [1, 2, 7, 8, 9], # invalid
#   [9, 7, 6, 2, 1], # invalid
#   [1, 3, 2, 4, 5], # invalid
#   [8, 6, 4, 4, 1], # invalid
#   [1, 3, 6, 7, 9]  # valid
# ]

arrays = File.readlines('input.txt').map { |line| line.split.map(&:to_i) }
puts count_valid_arrays(arrays) 

