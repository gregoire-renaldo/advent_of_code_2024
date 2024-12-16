lines = File.readlines('input_1.txt').map do |line|
  # Split each line by the delimiter '|' and create a hash
  parts = line.strip.split('|')
  { parts[0].to_i => parts[1].to_i }
end

rules = lines.each_with_object({}) do |h, acc|
  h.each do |k, v|
    acc[k] ||= []
    acc[k] << v
  end
end

arrays = File.readlines('input_2.txt').map do |line|
  line.strip.split(',').map(&:to_i)
end

bad_lines = []
values = []


def unvalid_arrays(arrays, rules)
  bad_lines = []
  arrays.select do |array|
    valid = true
    (0...array.length - 1).each do |i|
      current = array[i]
      next_number = array[i + 1]
      if rules[current].nil? || !rules[current].include?(next_number)
       
        bad_lines << array
        break
      end
    end
  end
end

unvalid_arrays = unvalid_arrays(arrays, rules)
puts unvalid_arrays.count
puts unvalid_arrays[0]


# puts unvalid_arrays.map { |array| array[(array.size / 2).ceil] }.sum
# 
#
rules = {
  47=>[53, 13, 61, 29], 
  97=>[13, 61, 47, 29, 53, 75], 
  75=>[29, 53, 47, 61, 13], 
  61=>[13, 53, 29], 
  29=>[13], 
  53=>[29, 13]
}
# 
# 75,97,47,61,53 becomes 97,75,47,61,53

example_array = [75,97,47,61,53]

def reorder_array(arr, rules)
  order = {}
  
  rules.each_with_index do |(key, value), index|
    order[key] = index
    value.each_with_index do |val, sub_index|
      order[val] = index + sub_index + 1
    end
  end
  arr.sort_by { |n| order[n] || Float::INFINITY }
end

bad_array = [75, 97, 47, 61, 53]

reordered_array = reorder_array(bad_array, rules)

puts reordered_array.inspect