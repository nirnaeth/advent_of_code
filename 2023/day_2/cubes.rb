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

def valid_hand?(hand)
  max = {
    red: 12,
    green: 13,
    blue: 14
  }

  blue = hand.fetch(:blue, 0)
  green = hand.fetch(:green, 0)
  red = hand.fetch(:red, 0)

  blue <= max[:blue] && green <= max[:green] && red <= max[:red]
end

def possible_games(values)
  games_hash = parse(values)

  [].tap do |possible|
    games_hash.each_with_index do |hands, index| 
      valid_hands = hands.select { |hand| valid_hand?(hand) } 
      
      possible << index + 1 if hands.count == valid_hands.count
    end
  end
end

# p possible_games(games).sum

def set(game)
  min = {
    blue: 0,
    green: 0,
    red: 0
  }

  game.each do |hand|
    blue = hand.fetch(:blue, 0)
    red = hand.fetch(:red, 0)
    green = hand.fetch(:green, 0)

    min[:blue] = blue if blue > min[:blue]
    min[:red] = red if red > min[:red]
    min[:green] = green if green > min[:green]
  end

  min
end

def power(set)
  set.fetch(:blue, 1) * set.fetch(:red, 1) * set.fetch(:green, 1)
end

def sum_of_powers(values)
  games_hash = parse(values)

  games_hash
    .map { |game| set(game) }
    .map { |set| power(set) } 
    .sum
end

p sum_of_powers(games)