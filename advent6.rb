require 'set'

input = File.open("advent6.txt").read.split("\n")
val = 0
coords = {}
input.each do |line|
  x, y = line.split(', ').map(&:to_i)
  coords[val] = [x,y]
  val += 1
end

grid = Array.new(400) { Array.new(400) {nil} }

i = 0

while i < grid.length
  j = 0
  while j < grid.length
    distances = coords.map do |name, axis|
      x = axis[0]
      y = axis[1]

      distance = (i - x).abs + (j - y).abs
      [name , distance]
    end.sort_by { |el| el[1] }

    if distances[0][1] != distances[1][1]
      grid[i][j] = distances[0][0]
    end
    j += 1
  end
  i += 1
end

#delete bound points
to_delete = Set.new

i = 0

while i < grid.length
  j = 0
  while j < grid.length
    if i == 0 || j == 0 || i == grid.length || j == grid.length
      to_delete << grid[i][j]
    end

    j += 1
  end
  i += 1
end

grid = grid.flatten.delete_if { |v| to_delete.include?(v) }

group = grid.group_by { |el| el }

# grid.flatten.group_by { |el| el }.sort_by { |k, v| v.length }.reverse[1][1].length


result = group.sort_by { |k, v| v.length }.reverse
result[0][1].length
