str = File.read("input.txt")

def string_to_array(str)
  lines_array = str.split("\n").map { |line| line.split(" ").map(&:to_i) }
  left_arr = lines_array.map { |a| a[0] }
  right_arr = lines_array.map { |a| a[1] }

  left_arr.sort!
  right_arr.sort!

  array_of_smallest_values_pairs = left_arr.zip(right_arr)
end

def sum_gap_between_numbers(arr)
  sum = arr.map { |a| (a[1] - a[0]).abs }.sum
end

p sum_gap_between_numbers(string_to_array(str))