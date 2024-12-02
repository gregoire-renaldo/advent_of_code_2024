str = File.read("input.txt")

lines_array = str.split("\n").map { |line| line.split(" ").map(&:to_i) }
left_arr = lines_array.map { |a| a[0] }
right_arr = lines_array.map { |a| a[1] }

h = {}
left_arr.uniq.each do |l|
  right_arr.each do |r|
    h[l] = h.fetch(l, 0) + 1 if l == r
  end
end

sum = left_arr.map { |el| el * h[el] if h[el] }.compact.sum
p sum