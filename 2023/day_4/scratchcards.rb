# https://adventofcode.com/2023/day/4

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_4/input.txt"
values = Input.new(path).to_str_array("\n")

def points_won(values)
  [].tap do |points| 
    values
      .map do |card| 
        elements = card
          .split(": ")[1]
          .split(' | ')
          .map { |card| card.split(' ') }

        matches = elements[0] & elements[1]
        points << 2 ** (matches.count - 1) unless matches.empty?
      end
  end.sum
end

# p points_won(values)

def cards_won(values)
  [].tap do |cards| 
    values
      .map do |card| 
        elements = card
          .split(": ")[1]
          .split(' | ')
          .map { |card| card.split(' ') }

        cards << (elements[0] & elements[1]).count
      end
  end
end

cards_won(values)