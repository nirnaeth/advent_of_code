require './day_5/vents'

RSpec.describe '#lines_from_coordinates' do
  it 'returns an array of vent lines' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_5/input.txt')

    lines = lines_from_coordinates(input_path)
    
    expect(lines).to eq expected
  end
end

def expected
  [
    [[0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9]],
    [[8, 0], [7, 1], [6, 2], [5, 3], [4, 4], [3, 5], [2, 6], [1, 7], [0, 8]],
    [[9, 4], [8, 4], [7, 4], [6, 4], [5, 4], [4, 4], [3, 4]],
    [[2, 2], [2, 1]],
    [[7, 0], [7, 1], [7, 2], [7, 3], [7, 4]],
    [[6, 4], [5, 3], [4, 2], [3, 1], [2, 0]],
    [[0, 9], [1, 9], [2, 9]],
    [[3, 4], [2, 4], [1, 4]],
    [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8]],
    [[5, 5], [6, 4], [7, 3], [8, 2]]
  ]
end