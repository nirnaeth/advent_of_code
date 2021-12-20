require './day_12/cave_paths'
require 'pry'

RSpec.describe '#list_caves_paths' do
  it 'lists all caves that can be visited from a cave' do
    input = ['start-A', 'start-b', 'A-c', 'A-b', 'b-d', 'A-end', 'b-end']
    input = ['start-A', 'start-b', 'A-c', 'A-b', 'b-d', 'A-end', 'b-end']

    paths = list_caves_paths(input)

    expect(list_caves_paths(input)).to match ({
      'start' => ['A', 'b'],
      'A' => ['c', 'b', 'end'],
      'b' => ['d', 'end']
    })
  end
end