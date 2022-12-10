# https://adventofcode.com/2022/day/8

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_8/input.txt"
map = Input.new(path).to_coordinates

Tree = Struct.new('Tree', :x, :y, :height)

def edges?(map, tree)
  return true if tree.x == 0 || tree.y == 0

  max_x, max_y = map.keys.last.split(":").map(&:to_i)
  return true if tree.x == max_x ||  tree.y == max_y
end

def top_max(map, tree)
  x = tree.x
  y = tree.y

  [].tap do |a|
    (0..y - 1).each { |n| a << map["#{x}:#{n}"] }
  end.max
end

def right_max(map, tree)
  x = tree.x
  y = tree.y

  max_x, max_y = map.keys.last.split(":").map(&:to_i)
  
  [].tap do |a|
    (x + 1..max_x).each { |n| a << map["#{n}:#{y}"] }
  end.max
end

def down_max(map, tree)
  x = tree.x
  y = tree.y

  max_x, max_y = map.keys.last.split(":").map(&:to_i)

  [].tap do |a|
    (y + 1..max_y).each { |n| a << map["#{x}:#{n}"] }
  end.max
end

def left_max(map, tree)
  x = tree.x
  y = tree.y
  
  [].tap do |a|
    (0..x - 1).each { |n| a << map["#{n}:#{y}"] }
  end.max
end

def line_of_sight?(map, tree)
  top_max(map, tree) < tree.height || 
  right_max(map, tree) < tree.height || 
  down_max(map, tree) < tree.height || 
  left_max(map, tree) < tree.height
end

def visible?(map, tree)
  edges?(map, tree) || line_of_sight?(map, tree)
end

def visible_trees(map)
  map.select do |coords, height|
    x, y = coords.split(":").map(&:to_i)
    tree = Tree.new(x, y, height)

    visible?(map, tree)
  end.count
end

p visible_trees(map)

  