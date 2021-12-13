# https://adventofcode.com/2021/day/8

$LOAD_PATH << './lib'
require 'input'
require 'pry'
path = 'support/day_9/input.txt'
heightmap = Input.new(path).to_bit_matrix

Coordinate = Struct.new(:x, :y)

def neighbours(coordinates, map)
  neighbours = []

  neighbours << map[coordinates.y][coordinates.x - 1] if coordinates.x > 0 # right
  neighbours << map[coordinates.y + 1][coordinates.x] if coordinates.y + 1 < map.size # down
  neighbours << map[coordinates.y][coordinates.x + 1] if coordinates.x + 1 < map.first.size # left
  neighbours << map[coordinates.y - 1][coordinates.x] if coordinates.y > 0 # top
  
  neighbours
end

def low_points(map)
  [].tap do |result|
    map.each_with_index do |row, i|
      row.each_with_index do |element, j|
        result << element if element < neighbours(Coordinate.new(j, i), map).min
      end
    end
  end
end

def risk(points)
  points.inject(0) { |sum, n| sum + (n + 1) } 
end

points = low_points(heightmap)

p risk(points)
