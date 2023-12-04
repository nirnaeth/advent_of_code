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

def games_array
  [
    [
      { blue: 3, red: 4},
      { red: 1, green: 2, blue: 6},
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