require './day_7/part_2'
require 'pry'

RSpec.describe '#blast_position' do
  it 'returns the location that is the least expensive for fuel' do
    path = 'spec/support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')

    expect(blast_position(crabs)).to eq 4.9
  end
end

RSpec.describe 'calculate_fuel' do
  it 'returns the total amount of fuel needed to move the crabs' do
    path = 'spec/support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')
    position = 4.9

    fuel = calculate_fuel(crabs, position)
    expect(fuel).to eq 168
  end
end

