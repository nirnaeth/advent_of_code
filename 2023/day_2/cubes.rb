# https://adventofcode.com/2023/day/2

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_2/input.txt"
games = Input.new(path).to_str_array("\n")

def hand_to_hash(hand)
  {}.tap do |h|
    hand
      .split(", ")
      .map do |cubes| 
        number, color = cubes.split(" ")
        h[color.to_sym] = number.to_i
      end
  end
end

##
# \s* removes the initial spaces
def parse(values) 
  values
    .map { |game| game.split(":")[1].scan(/\s*([\d+ \w+,?]+);?/) }
    .map { |hands| hands.map { |hand| hand_to_hash(hand.pop) } }
end

