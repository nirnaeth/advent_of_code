# https://adventofcode.com/2022/day/8

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_8/input.txt"
map = Input.new(path).to_coordinates

Tree = Struct.new('Tree', :x, :y, :height)

def visible?(map, tree)
  y = tree[0]
  x = tree[1]
  
  edges?(map, x, y) 
end

private

  def edges?(map, x, y)
    return true if x == 0 || y == 0

    max_y, max_x = map.keys.last.split(":").map(&:to_i)
    return true if y == max_y || x == max_x
  end
