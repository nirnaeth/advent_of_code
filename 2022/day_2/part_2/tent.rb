# https://adventofcode.com/2022/day/2

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_2/input.txt"

rounds = Input.new(path).to_str_array

## Shapes
## A - Rock
## B - Paper
## C - Scissors

## Strategy
## X - Loss
## Y - Draw
## Z - Win

## Scoring
## Selected Shape + Round Outcome 
## A - 1            0 - Loss
## B - 2            3 - Draw
## C - 3            6 - Win
def my_hand(round)
  case round
  when "A Y", "B X", "C Z" # _ Rock
    1
  when "B Y", "C X", "A Z" # _ Paper
    2
  when "C Y", "A X", "B Z" # _ Scissor
    3
  end
end

def pool(rounds)
  wins   = []
  draws  = []
  losses = []
  
  rounds.each do |round|
    case round
    when "A Y", "B Y", "C Y" # -> Rock Rock, Paper Paper, Scissor Scissor
      draws << my_hand(round)
    when "A Z", "B Z", "C Z" # -> Rock Paper, Paper Scissor, Scissor Rock
      wins << my_hand(round) 
    when "A X", "B X", "C X" # -> Rock Scissor, Paper Rock, Scissor Paper
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
## A - 1            0 - Loss
## B - 2            3 - Draw
## C - 3            6 - Win

def score(rounds)
  pools = pool(rounds)

  losses_score = pools[:losses].count * 0 + pools[:losses].sum
  draws_score = pools[:draws].count * 3 + pools[:draws].sum
  wins_score = pools[:wins].count * 6 + pools[:wins].sum

  losses_score + draws_score + wins_score
end

p score(rounds)