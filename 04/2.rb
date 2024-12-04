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

# Part 2: check corners for 'M' and 'S' starting from certain coordinates
def check_ms(i, j, grid)
  diag1 = [dig(i - 1, j - 1, grid), dig(i + 1, j + 1, grid)]
  diag2 = [dig(i - 1, j + 1, grid), dig(i + 1, j - 1, grid)]
  [diag1, diag2].all? { |diag| (diag & %w[M S]).length == 2 }
end

def solve2(path)
  grid = File.read(path).split("\n").map { |line| line.chars }
  candidates = find_coords('A', grid)
  candidates.count { |coords| check_ms(*coords, grid) }
end

p solve2('input.txt')