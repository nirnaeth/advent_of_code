# https://adventofcode.com/2021/day/8

$LOAD_PATH << './lib'
require 'input'
require 'pry'
path = 'support/day_9/input.txt'
heightmap = Input.new(path).to_bit_matrix

Coordinate = Struct.new(:x, :y)

def neighbours(coordinates, map)
  neighbours = []

  neighbours << map[coordinates.y][coordinates.x - 1] if coordinates.x - 1 > 0 # right
  neighbours << map[coordinates.y + 1][coordinates.x] if coordinates.y + 1 < map.size # down
  neighbours << map[coordinates.y][coordinates.x + 1] if coordinates.x + 1 < map.first.size # left
  neighbours << map[coordinates.y - 1][coordinates.x] if coordinates.y - 1 > 0 # top
  
  neighbours
end
