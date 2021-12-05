# https://adventofcode.com/2021/day/4

$LOAD_PATH << './lib'
require 'input'
require 'pry'
require_relative 'card'

input_path = File.expand_path(File.dirname(__FILE__) + '/../support/day_4/input.txt')

def setup(input_path)
  file = File.new(input_path, 'r')

  elements = file.read.split("\n\n")

  # the first element is the numbers being called
  # it has a slightly different format compared to the other elements that follow, 
  # because numbers are separated by commas.
  # so we remove it to allow for easier process of the other elements
  extraction = elements.shift.split(',').map(&:to_i)

  # here we build the cards. each element corresponds to a card.
  # a card is a series of contiguous lines separated by \n.
  # a card will be represented as an array of arrays.
  # 
  # how the original input looks like
  # cards
  # "22 13 17 11  0\n 8  2 23  4 24\n21  9 14 16  7\n 6 10  3 18  5\n 1 12 20 15 19"
  # " 3 15  0  2 22\n 9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6"
  # "14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n 2  0 12  3  7"
  #
  # how it looks after cleaning
  # [[22, 13, 17, 11, 0], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]
  # [[3, 15, 0, 2, 22], [9, 18, 13, 17, 5], [19, 8, 7, 25, 23], [20, 11, 10, 24, 4], [14, 21, 16, 12, 6]]
  # [[14, 21, 17, 24, 4], [10, 16, 15, 9, 19], [18, 8, 23, 26, 20], [22, 11, 13, 6, 5], [2, 0, 12, 3, 7]]
  cards = [].tap do |cards|
    elements.each do |element|
      values = [].tap do |card|
        element.split("\n").each do |line|
          # split on whitespaces, remove empty strings
          card << 
            line
            .split(/\s/)
            .reject { |item| item.empty? }
            .map(&:to_i)
        end
      end

      cards << Card.new(values)
    end
  end

  return extraction, cards
end

# -----------------------------------------------------------------------------------

numbers, cards = setup(input_path)

def play(numbers, cards)
  numbers.each do |number|
    cards.each do |card| 
      card.mark(number)
    end

    winner = cards.select { |card| card.bingo? }
    return number, winner.pop unless winner.empty?
  end  
end

# p play(numbers, cards)
