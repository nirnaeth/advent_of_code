require "./day_4/card"

RSpec.describe 'Card' do
  describe '#mark' do
    it 'removes the number from the card by marking it with -1' do
      card = Card.new([
        [22, 13, 17, 11, 0], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ])

      card.mark(22)

      expect(card.rows).to eq [
        [-1, 13, 17, 11, 0], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ]
    end

    it 'sets the card as winning if all numbers in a row are marked' do
      card = Card.new([
        [22, -1, -1, -1, -1], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ])

      card.mark(22)

      expect(card.bingo?).to be true
    end

    it 'sets the card as winning if all numbers in a column are marked' do
      card = Card.new([
        [22, 13, 17, 11, 0], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ])
      
      card.mark(13)
      card.mark(2)
      card.mark(9)
      card.mark(10)
      card.mark(12)

      expect(card.bingo?).to be true
    end
  end

  describe '#sum' do
    it 'returns the sum of all numbers on a card that were not marked' do
      card = Card.new([
        [-1, -1, -1, -1, -1],
        [10, 16, 15, 19, -1],
        [18, 8, 26, 20, -1],
        [22, 13, 6, -1, -1],
        [12, 3, -1, -1, -1]
      ])

      expect(card.sum).to eq 188
    end
  end
end
