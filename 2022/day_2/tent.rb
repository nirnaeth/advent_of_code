# https://adventofcode.com/2022/day/2

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_2/input.txt"

rounds = Input.new(path).to_str_array

## Shapes
## A / X - Rock
## B / Y - Paper
## C / Z - Scissors

## Scoring
## Selected Shape + Round Outcome 
## X - 1            0 - Loss
## Y - 2            3 - Draw
## Z - 3            6 - Win

def pool(rounds)
  wins   = []
  draws  = []
  losses = []
  
  rounds.each do |round|
    case round
    when "A X", "B Y", "C Z"
      draws << my_hand(round)
    when "C X", "B Z", "A Y"
      wins << my_hand(round)
    else
      losses << my_hand(round)
    end
  end

  {
    draws:  draws,
    losses: losses,
    wins:   wins
  }
end

def my_hand(round)
  case round.split(" ").last
  in "X"
    1
  in "Y"
    2
  in "Z"
    3
  end
end

# def score(rounds)
# end