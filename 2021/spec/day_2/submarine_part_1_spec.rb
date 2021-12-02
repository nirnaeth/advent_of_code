require "./day_2/part_1/submarine"

RSpec.describe Submarine do
  subject(:submarine) { Submarine.new }

  it "has an initial position" do  
    expect(submarine.position.x).to be 0
    expect(submarine.position.y).to be 0
  end

  describe "#move" do
    it "moves the submarine forward" do
      command = [:forward, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 2
      expect(submarine.position.y).to be 0
    end

    it "sends the submarine deeper" do
      command = [:down, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 0
      expect(submarine.position.y).to be 2
    end

    it "sends the submarine upward" do
      command = [:up, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 0
      expect(submarine.position.y).to be -2
    end
  end
end