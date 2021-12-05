require './day_4/bingo'

RSpec.describe '#setup' do
  it 'returns an array for the extraction and an array for the cards' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_4/input.txt')

    numbers, cards = setup(input_path)
    
    expect(numbers).to eq expected.first
    expect(cards.size).to eq 3
    expect(cards[0].rows).to match_array expected.last[0].rows
  end
end

def expected
  [
    [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1],
    [
      Card.new([
        [22, 13, 17, 11, 0],
        [8, 2, 23, 4, 24],
        [21, 9, 14, 16, 7],
        [6, 10, 3, 18, 5],
        [1, 12, 20, 15, 19]
      ]),
      Card.new([
        [3, 15, 0, 2, 22],
        [9, 18, 13, 17, 5],
        [19, 8, 7, 25, 23],
        [20, 11, 10, 24, 4],
        [14, 21, 16, 12, 6]
      ]),
      Card.new([
        [14, 21, 17, 24, 4],
        [10, 16, 15, 9, 19],
        [18, 8, 23, 26, 20],
        [22, 11, 13, 6, 5],
        [2, 0, 12, 3, 7]
      ])
    ]
  ]
end

RSpec.describe '#play' do
  it 'returns the winning card' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_4/input.txt')

    numbers, cards = setup(input_path)

    _, winner = play(numbers, cards)
    
    expect(winner.bingo?).to be true
    expect(winner.rows).to eq [
      [-1, -1, -1, -1, -1],
      [10, 16, 15, -1, 19],
      [18, 8, -1, 26, 20],
      [22, -1, 13, 6, -1],
      [-1, -1, 12, 3, -1]
    ]
  end

  it 'returns the winning number' do
    input_path = File.expand_path(File.dirname(__FILE__) + '/../spec/support/day_4/input.txt')

    numbers, cards = setup(input_path)

    winner, _ = play(numbers, cards)
    
    expect(winner).to eq 24
  end
end