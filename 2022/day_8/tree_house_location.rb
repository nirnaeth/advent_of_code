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

def top(map, tree)
  x = tree.x
  y = tree.y

  [].tap do |a|
    (0..y - 1).each { |n| a << map["#{x}:#{n}"] }
  end
end

def right(map, tree)
  x = tree.x
  y = tree.y

  max_x, max_y = map.keys.last.split(":").map(&:to_i)
  
  [].tap do |a|
    (x + 1..max_x).each { |n| a << map["#{n}:#{y}"] }
  end
end

def bottom(map, tree)
  x = tree.x
  y = tree.y

  max_x, max_y = map.keys.last.split(":").map(&:to_i)

  [].tap do |a|
    (y + 1..max_y).each { |n| a << map["#{x}:#{n}"] }
  end
end

def left(map, tree)
  x = tree.x
  y = tree.y
  
  [].tap do |a|
    (0..x - 1).each { |n| a << map["#{n}:#{y}"] }
  end
end

def line_of_sight?(map, tree)
  top(map, tree).max < tree.height || 
  right(map, tree).max < tree.height || 
  bottom(map, tree).max < tree.height || 
  left(map, tree).max < tree.height
end

def visible?(map, tree)
  edges?(map, tree) || line_of_sight?(map, tree)
end

def visible_trees(map)
  map.select do |coords, height|
    x, y = coords.split(":").map(&:to_i)
    tree = Tree.new(x, y, height)

    visible?(map, tree)
  end
end

# p visible_trees(map).count

# based on https://github.com/SvetlanaM/Advent-of-Code/blob/master/2022/day08/day08.py#L47
def score(heights, tree)
    score = 0

    # line of sight until the edge
    return heights.size if heights.max < tree.height

    # line of sight until a tree as tall or taller
    heights.each do |h|
      score += 1 
      break if h >= tree.height 
    end

    score
end

def scenic_score(map)
  trees = visible_trees(map)

  # p trees
  {}.tap do |h|
      trees.each do |coords, height|
        x, y = coords.split(":").map(&:to_i)
        tree = Tree.new(x, y, height)
        
        if edges?(map, tree)
          h["#{tree.x}:#{tree.y}"] = 0 
        else
          # p tree
          
          t = score(top(map, tree).reverse, tree)
          l = score(left(map, tree).reverse, tree)
          b = score(bottom(map, tree), tree)
          r = score(right(map, tree), tree)

          h["#{tree.x}:#{tree.y}"] = t * l * b * r
        end
      end
  end

end  

p scenic_score(map).values.max