require './day_5/vents'

RSpec.describe '#read_coordinates' do
  it 'transforms a pair string into an array containing a pair of points' do
    pair = '0,9 -> 5,9'

    expect(read_coordinates(pair)).to eq [[0, 9], [5, 9]]
  end
end

RSpec.describe '#lines_from_coordinates' do
  it 'returns an array of vent lines' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_5/input.txt')

    lines = lines_from_coordinates(input_path)

    expect(lines).to eq expected_lines
  end
end

RSpec.describe '#fill_diagram' do
  it 'returns a diagram with the lines marked by positive integers' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_5/input.txt')

    lines = lines_from_coordinates(input_path)
    diagram = fill_diagram(lines)

    expect(diagram).to eq expected_diagram
  end
end

def expected_lines
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

def expected_diagram
  [
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 1, 1, 2, 1, 1, 1, 2, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [2, 2, 2, 1, 1, 1, 0, 0, 0, 0]
  ]
end