require './day_6/part_2/growth'
require 'pry'

RSpec.describe '#setup' do
  it 'organizes fishes by day' do
    fishes = [3,4,3,1,2]
    
    ledger = setup(fishes)

    expect(ledger).to eq [0, 1, 1, 2, 1, 0, 0, 0, 0]
  end
end

RSpec.describe '#grow' do
  it 'counts down the days until the fish spawns' do
    ledger = [0, 1, 1, 2, 1, 0, 0, 0, 0]
    days = 1

    generation = grow(ledger, days)

    expect(generation).to eq [1,1,2,1,0,0,0,0,0]
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

