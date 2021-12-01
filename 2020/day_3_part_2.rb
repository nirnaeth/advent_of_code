$LOAD_PATH << './lib'
require "input"
require "ostruct"

path = "support/input_day_3.txt"
source = Input.new(path).to_str_array

def trees_on_slope(source, slope)
  position = OpenStruct.new(col: 1, row: 1)
  modulo = source.first.length
  offset = 1
  tree = "#"
  iterations = (source.count - offset) / slope.down

  [].tap { |a|
    iterations.times do |x| 
      position.row += slope.down
      position.col += slope.side

      # p "#{position.col},#{position.row}"
      # p source[position.row - 1][(position.col - 1) % source.count]

      element = source[position.row - offset][(position.col - offset) % modulo]
      a << element if element == tree
    end
  }
  .count
end

Slope = Struct.new(:down, :side)

def all_trees_on_slopes(source)
  slopes = [
    Slope.new(1, 1),
    Slope.new(1, 3),
    Slope.new(1, 5),
    Slope.new(1, 7),
    Slope.new(2, 1)
  ]
  
  slopes.map { |s| trees_on_slope(source, s) }.reduce(:*)
end

p all_trees_on_slopes(source)

