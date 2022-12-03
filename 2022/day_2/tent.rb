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
def my_hand(round)
  case round.split(" ").last
  in "X" # Rock
    1
  in "Y" # Paper
    2
  in "Z" # Scissor
    3
  end
end

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

## Scoring
## Selected Shape + Round Outcome 
## X - 1            0 - Loss
## Y - 2            3 - Draw
## Z - 3            6 - Win

def score(rounds)
  pools = pool(rounds)

  losses_score = pools[:losses].count * 0 + pools[:losses].sum
  draws_score = pools[:draws].count * 3 + pools[:draws].sum
  wins_score = pools[:wins].count * 6 + pools[:wins].sum

  losses_score + draws_score + wins_score
end

p score(rounds)