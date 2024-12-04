# str = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
str = File.read("input.txt")

str.gsub(/don't\(\)_mul.*do\(\)/, "")
mul = str.scan(/mul\((\d+),(\d+)\)/).map { |a, b| a.to_i * b.to_i }.sum
p mul