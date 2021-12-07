require './day_7/part_2'
require 'pry'

#16,1,2,0,4,2,7,1,2,14
RSpec.describe '#find_distances' do
  it 'calculates all possible distances for all possible crabs' do
    path = 'spec/support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')

    distances = find_distances(crabs)
    
    expect(distances).to eq expected
  end  
end

RSpec.describe '#min_distance' do
  it 'finds the shortest distance all crabs have to move' do
    distances = expected

    expect(min_distance(distances)).to eq 5
  end
end

RSpec.describe '#calculate_fuel' do
  it 'returns the total fuel needed to move the crabs' do
    path = 'spec/support/day_7/input.txt'
    crabs = Input.new(path).to_int_array(',')

    distances = find_distances(crabs)

    fuel = calculate_fuel(distances[5])

    expect(fuel).to eq 168
  end
end
# RSpec.describe '#blast_position' do
#   it 'returns the location that is the least expensive for fuel' do
#     path = 'spec/support/day_7/input.txt'
#     crabs = Input.new(path).to_int_array(',')

#     expect(blast_position(crabs)).to eq 4.9
#   end
# end

# RSpec.describe 'calculate_fuel' do
#   it 'returns the total amount of fuel needed to move the crabs' do
#     path = 'spec/support/day_7/input.txt'
#     crabs = Input.new(path).to_int_array(',')
#     position = 4.9

#     fuel = calculate_fuel(crabs, position)
    
#     expect(fuel).to eq 168
#   end
# end

def expected
  [
    [16, 1, 2, 0, 4, 2, 7, 1, 2, 14], 
    [15, 0, 1, -1, 3, 1, 6, 0, 1, 13], 
    [14, -1, 0, -2, 2, 0, 5, -1, 0, 12], 
    [13, -2, -1, -3, 1, -1, 4, -2, -1, 11], 
    [12, -3, -2, -4, 0, -2, 3, -3, -2, 10], 
    [11, -4, -3, -5, -1, -3, 2, -4, -3, 9], 
    [10, -5, -4, -6, -2, -4, 1, -5, -4, 8], 
    [9, -6, -5, -7, -3, -5, 0, -6, -5, 7], 
    [8, -7, -6, -8, -4, -6, -1, -7, -6, 6], 
    [7, -8, -7, -9, -5, -7, -2, -8, -7, 5], 
    [6, -9, -8, -10, -6, -8, -3, -9, -8, 4], 
    [5, -10, -9, -11, -7, -9, -4, -10, -9, 3], 
    [4, -11, -10, -12, -8, -10, -5, -11, -10, 2], 
    [3, -12, -11, -13, -9, -11, -6, -12, -11, 1], 
    [2, -13, -12, -14, -10, -12, -7, -13, -12, 0], 
    [1, -14, -13, -15, -11, -13, -8, -14, -13, -1], 
    [0, -15, -14, -16, -12, -14, -9, -15, -14, -2], 
    [-1, -16, -15, -17, -13, -15, -10, -16, -15, -3]
  ]
  
end