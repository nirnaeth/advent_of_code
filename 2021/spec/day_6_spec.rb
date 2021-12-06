require './day_6/growth'
require 'pry'

RSpec.describe '#grow' do
  it 'counts down the days until the fish spawns' do
    path = 'spec/support/day_6/input.txt'
    fishes = Input.new(path).to_int_array(',')
    days = 1
    
    # binding.pry
    generation = grow(fishes, days)

    expect(generation).to eq [2,3,2,0,1]
  end
end

