# str = File.read("input.txt")
# str = vedg
#
# [
#   "MMMSXXMASM"
#   "MSAMXMSMSA",
#   "AMXSXMAAMM",
#   "MSAMASMSMX",
#   "XMASAMXAMM",
#   "XXAMMXXAMA",
#   "SMSMSASXSS",
#   "SAXAMASAAA",
#   "MAMMMXMMMM",
#   "MXMXAXMASX",
# ]

# A safe dig method (returns nil when out of bounds)
def dig(i, j, grid)
  (i < 0) || (j < 0) ? nil : grid.dig(i, j)
end

# Find [i, j] coordinates of a certain character in grid
def find_coords(char, grid)
  m = grid.length
  n = grid[0].length
  coords = []
  (0...m).each do |i|
    (0...n).each do |j|
      coords << [i, j] if grid[i][j] == char
    end
  end
  coords
end

# Part 1: check all directions starting from given coordinates
def count_xmas(i, j, grid)
  checks = [
    ->(k){ dig(i, j + k, grid) },
    ->(k){ dig(i, j - k, grid) },
    ->(k){ dig(i + k, j, grid) },
    ->(k){ dig(i - k, j, grid) },
    ->(k){ dig(i + k, j + k, grid) },
    ->(k){ dig(i + k, j - k, grid) },
    ->(k){ dig(i - k, j - k, grid) },
    ->(k){ dig(i - k, j + k, grid) }
  ]
  checks.count { |check| (0..3).map(&check).join == 'XMAS' }
end

def solve1(path)
  grid = File.read(path).split("\n").map { |line| line.chars }
  candidates = find_coords('X', grid)
  candidates.sum { |coords| count_xmas(*coords, grid) }
end

p solve1('input.txt')
