input = File.read('input.txt')
tot = 0

def mul(a, b)
  a * b
end

sections = input.split(/do\(\)/)
enabled_sections = sections.map { |x| x.split(/don't\(\)/).first }.join
scanned_mul = enabled_sections.scan(/mul\(\d{1,3},\d{1,3}\)/)

scanned_mul.map do |string|
  match = string.match(/mul\((\d{1,3}),(\d{1,3})\)/)
  a = match[1].to_i
  b = match[2].to_i
  tot += mul(a, b)
end

p tot