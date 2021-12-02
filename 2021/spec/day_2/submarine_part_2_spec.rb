require "./day_2/part_2/submarine"
require "pry"

RSpec.describe Submarine do
  subject(:submarine) { Submarine.new }

  it "has an initial position" do  
    expect(submarine.position.x).to be 0
    expect(submarine.position.y).to be 0
    expect(submarine.position.aim).to be 0
  end

  describe "#move" do
    it "moves the submarine forward by X units and down by submarine aim * X" do
      command = [:forward, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 2
      expect(submarine.position.y).to be 0 # aim is 0 at first
    end

    it "aims the submarine X units deeper" do
      command = [:down, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 0
      expect(submarine.position.y).to be 0
      expect(submarine.position.aim).to be 2
    end

    it "aims the submarine X units higher" do
      command = [:up, 2]

      submarine.move(command)

      expect(submarine.position.x).to be 0
      expect(submarine.position.y).to be 0
      expect(submarine.position.aim).to be -2
    end
  end
end