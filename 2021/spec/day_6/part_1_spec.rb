require './day_6/part_1/growth'
require 'pry'

RSpec.describe '#grow' do
  it 'counts down the days until the fish spawns' do
    fishes = [3,4,3,1,2]
    days = 1

    generation = grow(fishes, days)

    expect(generation).to eq [2,3,2,0,1]
  end

  it 'spanws a new fish (8) when a fish is ready' do
    fishes = [0]
    days = 1

    generation = grow(fishes, days)

    expect(generation).to eq [6,8]
  end

  it 'resets a fish (6) after 7 days' do
    fishes = [6]
    days = 7

    generation = grow(fishes, days)

    expect(generation).to eq [6,8]
  end
end

