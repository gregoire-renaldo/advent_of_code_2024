rules = [
{47=>53},
{97=>13},
{97=>61},
{97=>47},
{75=>29},
{61=>13},
{75=>53},
{29=>13},
{97=>29},
{53=>29},
{61=>53},
{97=>53},
{61=>29},
{47=>13},
{75=>47},
{97=>75},
{47=>61},
{75=>61},
{47=>29},
{75=>13},
{53=>13}
]


rules = lines.each_with_object({}) do |h, acc|
  h.each do |k, v|
    acc[k] ||= []
    acc[k] << v
  end
end

# rules = {
#   47=>[53, 13, 61, 29], 
#   97=>[13, 61, 47, 29, 53, 75], 
#   75=>[29, 53, 47, 61, 13], 
#   61=>[13, 53, 29], 
#   29=>[13], 53=>[29, 13]
# }

# arrays = [
#   [75,47,61,53,29],
#   [97,61,53,29,13],
#   [75,29,13],
#   [75,97,47,61,53],
#   [61,13,29],
#   [97,13,75,29,47]
# ]
# 

good_lines = []
values = []

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