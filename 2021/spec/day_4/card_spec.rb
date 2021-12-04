require "./day_4/card"

RSpec.describe "Card" do
  describe "#mark" do
    it "removes the number from the card" do
      card = Card.new([
        [22, 13, 17, 11, 0], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ])

      card.mark(22)

      expect(card.values).to eq [
        [13, 17, 11, 0], 
        [8, 2, 23, 4, 24], 
        [21, 9, 14, 16, 7], 
        [6, 10, 3, 18, 5], 
        [1, 12, 20, 15, 19]
      ]
    end
  end
end
