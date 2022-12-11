require "pry"
require "./day_9/rope_physics.rb"

RSpec.describe "#touching?" do
  it "returns true if head and tail are on the same row (y) and no more than 1 space away" do
    #.T 
    #.H
    head = Point.new(0, 1)
    tail = Point.new(1, 1)

    expect(touching?(head, tail)).to be true
  end

  it "returns true if head and tail are on the same column (x) and no more than 1 space away" do
    #.. 
    #TH
    head = Point.new(0, 1)
    tail = Point.new(0, 0)

    expect(touching?(head, tail)).to be true
  end

  it "returns true if head and tail are overlapping" do
    #.. 
    #H.
    head = Point.new(0, 0)
    tail = Point.new(0, 0)

    expect(touching?(head, tail)).to be true
  end

  it "returns true if head and tail are on a diagonal and no more than 1 space away" do
    #.T 
    #H.
    head = Point.new(0, 0)
    tail = Point.new(1, 1)

    expect(touching?(head, tail)).to be true
  end

  it "returns false if head and tail are further than 1 space away on the same row" do
    #... 
    #H.T
    head = Point.new(0, 0)
    tail = Point.new(2, 0)

    expect(touching?(head, tail)).to be false
  end

  it "returns false if head and tail are further than 1 space away on the diagonal" do
    #..T 
    #H..
    head = Point.new(0, 0)
    tail = Point.new(2, 2)

    expect(touching?(head, tail)).to be false
  end
  
  it "returns false if head and tail are further than 1 space away on the same column" do
    #T.
    #.. 
    #H.
    head = Point.new(0, 0)
    tail = Point.new(0, 3)

    expect(touching?(head, tail)).to be false
  end
end

RSpec.describe "#move" do
  context "when head and tail are not touching" do
    it "moves the head right and the tail along the head when on the same row" do
      head = Point.new(0, 0)
      tail = Point.new(0, 0)
      instruction = "R 4"

      expect(move(instruction, head, tail)).to eq({
        head: [4, 0],
        tail: [3, 0]
      })
    end

    it "moves the head up and the tail along the head when on the same column" do
      head = Point.new(4, 0)
      tail = Point.new(3, 0)
      instruction = "U 4"

      expect(move(instruction, head, tail)).to eq({
        head: [4, 4],
        tail: [4, 3]
      })
    end

    it "moves the head left and the tail along the head across a diagonal" do
      head = Point.new(4, 4)
      tail = Point.new(4, 3)
      instruction = "L 3"

      expect(move(instruction, head, tail)).to eq({
        head: [1, 4],
        tail: [2, 4]
      })
    end

    it "moves the head right and the tail along the head across a diagonal" do
      head = Point.new(1, 3)
      tail = Point.new(2, 4)
      instruction = "R 4"

      expect(move(instruction, head, tail)).to eq({
        head: [5, 3],
        tail: [4, 3]
      })
    end
  end

  context "when head and tail are touching" do
    it "moves the head down and not the tail when on the same column" do
      head = Point.new(1, 4)
      tail = Point.new(2, 4)
      instruction = "D 1"
  
      expect(move(instruction, head, tail)).to eq({
        head: [1, 3],
        tail: [2, 4]
      })
    end
  end
end

RSpec.describe "tail_positions" do
  it "returns the number of positions visited by the tail" do
    path = "spec/data/day_9/input.txt"
    test_data = Input.new(path).to_str_array

    expect(tail_positions(test_data)).to eq 13
  end
end