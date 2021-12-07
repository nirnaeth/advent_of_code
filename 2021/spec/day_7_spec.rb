require './day_7/blast'
require 'pry'

RSpec.describe '#blast_position' do
  it 'returns the location that is the least expensive for fuel' do
    path = 'support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')

    expect(blast_position(crabs)).to eq 2
  end
end

RSpec.describe 'calculate_fuel' do
  it 'returns the total amount of fuel needed to move the crabs' do
    path = 'support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')
    position = 2

    fuel = calculate_fuel(crabs, position)
    expect(fuel).to eq 37
  end
end

