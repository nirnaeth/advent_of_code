require "pry"
require "./day_2/cubes.rb"

RSpec.describe "#hand_to_hash" do
  it "transforms a hand into its hash equivalent" do
    test_data = "3 blue, 4 red"

    expect(hand_to_hash(test_data)).to eq({ blue: 3, red: 4 })
  end
end

RSpec.describe "#parse" do
  it "returns a list of games" do
    path = "spec/data/day_2/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(parse(test_data)).to match games_array
  end
end

RSpec.describe "valid_hand?" do
  context "when all keys are present" do
    context "when all values are below the allowed max" do
      it "confirms that a hand is valid" do
        hand = { blue: 7, green: 1, red: 5}

        expect(valid_hand?(hand)).to be true
      end
    end

    context "when at least one of the values is above the allowed max" do
      it "confirms that a hand is not valid" do
        hand = { blue: 20, green: 1, red: 5}

        expect(valid_hand?(hand)).to be false
      end
    end
  end

  context "when at least one key is missing" do
    context "when all values are below the allowed max" do
      it "confirms that a hand is valid" do
        hand = { blue: 7, green: 1}

        expect(valid_hand?(hand)).to be true
      end
    end

    context "when at least one of the values is above the allowed max" do
      it "confirms that a hand is not valid" do
        hand = { blue: 20, green: 1}

        expect(valid_hand?(hand)).to be false
      end
    end
  end
end

RSpec.describe "#possible_games" do
  it "returns the index of the games that are possible given a max number of cubes of a certain color" do
    path = "spec/data/day_2/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(possible_games(test_data)).to eq [1, 2, 5]
  end
end

RSpec.describe "#set" do
  it "generates the set with the minimum amount of cubes to play a game" do
    expect(set(games_array[0])).to eq({ red: 4, green: 2, blue: 6 })
  end
end

RSpec.describe "#power" do
  it "calculates the power of a game's set of cubes" do
    set = { red: 4, green: 2, blue: 6 }

    expect(power(set)).to eq 48
  end
end

RSpec.describe "#sum_of_powers" do
  it "calculates the sum of all the games' powers" do
    path = "spec/data/day_2/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(sum_of_powers(test_data)).to eq 2286
  end
end

def games_array
  [
    [
      { blue: 3, red: 4 },
      { red: 1, green: 2, blue: 6 },
      { green: 2 }
    ],
    [
      { blue: 1, green: 2 },
      { green: 3, blue: 4, red: 1 },
      { green: 1, blue: 1 },
    ],
    [
      { green: 8, blue: 6, red: 20 },
      { blue: 5, red: 4, green: 13 },
      { green: 5, red: 1 }
    ],
    [
      { green: 1, red: 3, blue: 6 },
      { green: 3, red: 6 },
      { green: 3, blue: 15, red: 14 }
    ],
    [
      { red: 6, blue: 1, green: 3 },
      { blue: 2, red: 1, green: 2 }
    ]
  ]
end