$LOAD_PATH << './lib'
require "input"
require "ostruct"

path = "support/input_day_3.txt"
source = Input.new(path).to_str_array

# 11,11
# x,y
# 0,0
# move(3,1) -> select if #
# move(6,2) -> select if #
# move(9,3) -> select if #

# ..##....... 1,1
# #..O#...#.. -> move(3,1) -> position 4,2 .
# .#....X..#. -> move(3,1) -> position 7,3 #
# ..#.#...#O# -> move(3,1) -> position 10,4 .
# .X...##..#. -> move(3,1) -> position 13,5 #
# ..#.X#..... -> move(3,1) -> position 16,6 #
# .#.#.#.O..# -> move(3,1) -> position 19,7 .
# .#........X -> move(3,1) -> position 22,8 #
# #.X#...#... -> move(3,1) -> position 25,9 #
# #...#X....# -> move(3,1) -> position 28,10 #
# .#..#...X.# -> move(3,1) -> position 31,11 #
def trees_on_slope(source)
  position = OpenStruct.new(col: 1, row: 1)
  modulo = source.first.length
  offset = 1
  tree = "#"

  [].tap { |a|
    (source.count - offset).times do |x| 
      position.row += 1
      position.col += 3

      # p "#{position.col},#{position.row}"
      # p source[position.row - 1][(position.col - 1) % source.count]
      element = source[position.row - offset][(position.col - offset) % modulo]
      a << element if element == tree
    end
  }
  .count
end

p trees_on_slope(source)
