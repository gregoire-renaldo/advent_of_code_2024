lines = File.readlines('input_1.txt').map do |line|
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


def valid_arrays(arrays, rules)
  arrays.select do |array|
    valid = true
    (0...array.length - 1).each do |i|
      current = array[i]
      next_number = array[i + 1]
      if rules[current].nil? || !rules[current].include?(next_number)
        valid = false
        break
      end
    end
  
    valid
  end
end

def reorder_array(arr, rules)
  modified = true

  while modified
    modified = false

    arr.each_with_index do |num, index|
      rule = rules[num] || []

      rule.each do |after_num|
        after_index = arr.index(after_num)
        
        # If the number that should come after is ahead of this number, swap them
        if after_index && after_index < index
          # temp = arr[index]
          # arr[index] = arr[after_index]
          # arr[after_index] = temp
          arr[index], arr[after_index] = arr[after_index], arr[index]
          modified = true  # Mark that a change was made
          break
        end
      end
    end
  end

  arr
end

unvalid_arrays = arrays - valid_arrays(arrays, rules)

reordered_arrays = unvalid_arrays.map { |array| reorder_array(array, rules) }

puts reordered_arrays.map { |array| array[(array.size / 2).ceil] }.sum