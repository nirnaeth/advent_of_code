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

    expect(generation).to eq [1, 1, 2, 1, 0, 0, 0, 0, 0]
  end

  it 'spanws a new fish (8) when a fish is ready' do
    ledger = [1, 0, 0, 0, 0, 0, 0, 0, 0]
    days = 1

    generation = grow(ledger, days)

    expect(generation).to eq [0, 0, 0, 0, 0, 0, 1, 0, 1]
  end

  it 'resets a fish (6) after 7 days' do
    ledger = [0, 0, 0, 0, 0, 0, 1, 0, 0]
    days = 7

    generation = grow(ledger, days)

    expect(generation).to eq [0, 0, 0, 0, 0, 0, 1, 0, 1]
  end

  it 'returns a ledger with the correct amount of fishes' do
    ledger = [0, 1, 1, 2, 1, 0, 0, 0, 0]
    days = 18

    generation = grow(ledger, days)

    expect(generation).to eq [3, 5, 3, 2, 2, 1, 5, 1, 4]
    expect(generation.sum).to eq 26
  end
end

