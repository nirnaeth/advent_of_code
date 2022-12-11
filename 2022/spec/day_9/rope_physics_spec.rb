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

  it "returns false if head and tail are further than 1 space away" do
    #..T 
    #H..
    head = Point.new(0, 0)
    tail = Point.new(2, 2)

    expect(touching?(head, tail)).to be false
  end
end