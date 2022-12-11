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

  it "moves the head left" do
    head = Point.new(0, 0)
    instruction = "L 3"

    expect(move(instruction, head)).to eq [-3, 0]
  end

  it "moves the head down" do
    head = Point.new(0, 0)
    instruction = "D 1"

    expect(move(instruction, head)).to eq [0, -1]
  end
end