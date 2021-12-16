# https://adventofcode.com/2021/day/9

$LOAD_PATH << './lib'
require 'input'
require 'pry'
path = 'support/day_9/input.txt'
heightmap = Input.new(path).to_bit_matrix

Coordinate = Struct.new(:x, :y)

# ----- part 1
def neighbours_values(coordinates, map)
  neighbours = []
  
  neighbours << map[coordinates.y][coordinates.x - 1] if coordinates.x > 0 # right
  neighbours << map[coordinates.y + 1][coordinates.x] if coordinates.y + 1 < map.size # down
  neighbours << map[coordinates.y][coordinates.x + 1] if coordinates.x + 1 < map.first.size # left
  neighbours << map[coordinates.y - 1][coordinates.x] if coordinates.y > 0 # top
  
  neighbours
end

def low_points_values(map)
  [].tap do |result|
    map.each_with_index do |row, y|
      row.each_with_index do |element, x|
        result << element if element < neighbours_values(Coordinate.new(x, y), map).min
      end
    end
  end
end

def risk(points)
  points.inject(0) { |sum, n| sum + (n + 1) } 
end

# points = low_points_values(heightmap)

# risk(points)

# ----- part 2

# Uses flood fill algorithm 
# https://www.reddit.com/r/adventofcode/comments/rcfveb/2021_day_9_on_realising_these_things_are_the_same/hnwa2hs/
# approach 2 described here 
# https://www.reddit.com/r/adventofcode/comments/rcfveb/2021_day_9_on_realising_these_things_are_the_same/hnvn6nj/ 
# and marking the visited nodes as a 9
# other options are BfS https://algotree.org/algorithms/tree_graph_traversal/breadth_first_search/

# each point is represented by the coordinates as key y:x or row:column and the height as the value
def low_points(map)
  {}.tap do |result|
    map.each_with_index do |row, y|
      row.each_with_index do |element, x|
        result["#{y}:#{x}"] = element if element < neighbours_values(Coordinate.new(x, y), map).min
      end
    end
  end
end

points = low_points(heightmap)

def neighbours(coordinates, map)
  neighbours = {}

  neighbours["#{coordinates.y}:#{coordinates.x - 1}"] = map[coordinates.y][coordinates.x - 1] if coordinates.x > 0 # right
  neighbours["#{coordinates.y + 1}:#{coordinates.x}"] = map[coordinates.y + 1][coordinates.x] if coordinates.y + 1 < map.size # down
  neighbours["#{coordinates.y}:#{coordinates.x + 1}"] = map[coordinates.y][coordinates.x + 1] if coordinates.x + 1 < map.first.size # left
  neighbours["#{coordinates.y - 1}:#{coordinates.x}"] = map[coordinates.y - 1][coordinates.x] if coordinates.y > 0 # top
  
  neighbours
end

# Flood-fill (node):
#   1. Set Q to the empty queue or stack.
#   2. Add node to the end of Q.
#   3. While Q is not empty:
#   4.   Set n equal to the first element of Q.
#   5.   Remove first element from Q.
#   6.   If n is Inside:
#          Set the n
#          Add the node to the west of n to the end of Q.
#          Add the node to the east of n to the end of Q.
#          Add the node to the north of n to the end of Q.
#          Add the node to the south of n to the end of Q.
#   7. Continue looping until Q is exhausted.
#   8. Return.

def basins(points, heightmap)
  sizes = {}
  stack = {}

  points.each do |coords, height|
    # binding.pry if coords == "10:75"

    size = 0
    stack.merge!({coords => height})
    
    while stack.any? do # while Q is not empty
      key, value = stack.shift # n is the first element of Q

      if value != 9 # n is "inside"
        y = key.split(':').first.to_i
        x = key.split(':').last.to_i

        size += 1
        heightmap[y][x] = 9 # set n

        next_locations = neighbours(Coordinate.new(x, y), heightmap) # add the next nodes
        stack.merge!(next_locations)
      end
    end

    sizes.merge!({size => coords})
  end

  sizes
end

records = basins(points, heightmap)

p records.keys.sort.pop(3).inject(:*)