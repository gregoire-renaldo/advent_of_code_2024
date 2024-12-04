str = File.read("input.txt")
# str = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
mul = str.scan(/mul\((\d+),(\d+)\)/).map { |a, b| a.to_i * b.to_i }.sum
p mul