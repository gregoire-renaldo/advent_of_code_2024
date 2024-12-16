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

valid_arrays = valid_arrays(arrays, rules)
puts valid_arrays.map { |array| array[(array.size / 2).ceil] }.sum