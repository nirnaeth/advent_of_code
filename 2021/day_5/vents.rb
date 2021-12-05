# https://adventofcode.com/2021/day/5

$LOAD_PATH << './lib'
require 'input'
require 'matrix'
require 'pry'

input_path = File.expand_path(File.dirname(__FILE__) + '/../support/day_5/input.txt')

# read coordinates

def lines_from_coordinates(input_path)
  file = File.new(input_path, 'r')

  pairs = file.read.split("\n")

  # each line is in the form of x1, y1 -> x2, y2
  # we transform each pair in a line like
  # pair: 0,9 -> 5,9 
  # line: [[0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9]]
  [].tap do |lines|
    pairs.each do |pair|
      start, finish = pair.split('->').map(&:strip)
      start = start.split(',').map(&:to_i)
      finish = finish.split(',').map(&:to_i)
      
      negative = proc(&:negative?)
      positive = proc(&:positive?)
      horizontal_distance = start.first - finish.first
      vertical_distance = start.last - finish.last

      xs = case horizontal_distance
      when negative
        # example
        # pair: 0,9 -> 5,9
        # 0 - 5 = -5
        # we want the line xs to be going up
        # 0, 1, 2...
        (start.first..finish.first).to_a
      when positive
        # example
        # pair: 6,4 -> 2,0
        # 6 - 2 = 4
        # we want the line xs to go down
        # 6, 5, 4...
        (start.first..finish.first).step(-1).to_a
      else
        # if one of the two dimensions is just horizontal or vertial, we need to create
        # an array ad hoc with the same element repeating
        # the size of the array has to be offset by 1 because of the 0 index
        Array.new(vertical_distance.abs + 1, finish.first)
      end     

      ys = case vertical_distance
      when negative
        # example
        # pair: 8,0 -> 0,8
        # 0 - 8 = -8
        # we want the line ys to be going up
        # 0, 1, 2...
        (start.last..finish.last).to_a
      when positive
        # example
        # pair: 2,2 -> 2,1
        # 2 - 1 = 1
        # we want the line ys to go down
        # 2, 1
        (start.last..finish.last).step(-1).to_a
      else
        Array.new(horizontal_distance.abs + 1, finish.last)
      end

      lines << xs.zip(ys)
    end
  end
  # extraction = elements.shift.split(',').map(&:to_i)

  # # here we build the cards. each element corresponds to a card.
  # # a card is a series of contiguous lines separated by \n.
  # # a card will be represented as an array of arrays.
  # # 
  # # how the original input looks like
  # # cards
  # # "22 13 17 11  0\n 8  2 23  4 24\n21  9 14 16  7\n 6 10  3 18  5\n 1 12 20 15 19"
  # # " 3 15  0  2 22\n 9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6"
  # # "14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n 2  0 12  3  7"
  # #
  # # how it looks after cleaning
  # # [[22, 13, 17, 11, 0], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]
  # # [[3, 15, 0, 2, 22], [9, 18, 13, 17, 5], [19, 8, 7, 25, 23], [20, 11, 10, 24, 4], [14, 21, 16, 12, 6]]
  # # [[14, 21, 17, 24, 4], [10, 16, 15, 9, 19], [18, 8, 23, 26, 20], [22, 11, 13, 6, 5], [2, 0, 12, 3, 7]]
  # cards = [].tap do |cards|
  #   elements.each do |element|
  #     values = [].tap do |card|
  #       element.split("\n").each do |line|
  #         # split on whitespaces, remove empty strings
  #         card << 
  #           line
  #           .split(/\s/)
  #           .reject { |item| item.empty? }
  #           .map(&:to_i)
  #       end
  #     end

  #     cards << Card.new(values)
  #   end
  # end

  # return extraction, cards
end

lines_from_coordinates(input_path)
# -----------------------------------------------------------------------------------

# create diagram (array)
#   . if no lines cover that coordinate
#   1 if 1 line covers that coordinate
#   2 if 2 lines cover that coordinate
#   ...

# find points where 2+ lines cover the coordinate


