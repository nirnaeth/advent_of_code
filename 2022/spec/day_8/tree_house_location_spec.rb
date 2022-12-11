require "pry"
require "./day_8/tree_house_location.rb"

RSpec.describe "#visible?" do
  it "returns true when the tree is on the edge" do
    path = "spec/data/day_8/input.txt"
    test_data = Input.new(path).to_coordinates

    first_tree = Tree.new(0, 0, test_data["0:0"])
    last_tree = Tree.new(4, 4, test_data["4:4"])

    expect(visible?(test_data, first_tree)).to eq true
    expect(visible?(test_data, last_tree)).to eq true
  end

  it "returns true when the tree has line of sight from at least one of the edges" do
    test_data = {
      "0:0"=>3, "1:0"=>0, "2:0"=>3, "3:0"=>7, "4:0"=>3,
      "0:1"=>5, "1:1"=>5, "2:1"=>5, "3:1"=>4, "4:1"=>2,
      "0:2"=>6, "1:2"=>5, "2:2"=>3, "3:2"=>3, "4:2"=>2,
      "0:3"=>3, "1:3"=>3, "2:3"=>5, "3:3"=>1, "4:3"=>9,
      "0:4"=>3, "1:4"=>5, "2:4"=>5, "3:4"=>0, "4:4"=>0
    }

    # right
    visible_tree = Tree.new(1, 2, test_data["1:2"])
    expect(visible?(test_data, visible_tree)).to eq true

    # left
    visible_tree = Tree.new(2, 3, test_data["2:3"])
    expect(visible?(test_data, visible_tree)).to eq true

    # top
    visible_tree = Tree.new(1, 1, test_data["1:1"])
    expect(visible?(test_data, visible_tree)).to eq true

    # down
    visible_tree = Tree.new(3, 1, test_data["3:1"])
    expect(visible?(test_data, visible_tree)).to eq true
  end

  it "returns false when the tree has no line of sight" do
    path = "spec/data/day_8/input.txt"
    test_data = Input.new(path).to_coordinates

    visible_tree = Tree.new(1, 3, test_data["1:3"])
    expect(visible?(test_data, visible_tree)).to eq false
  end
end

RSpec.describe "#visible_trees" do
  it "returns the trees visible in the map" do
    path = "spec/data/day_8/input.txt"
    test_data = Input.new(path).to_coordinates

    expect(visible_trees(test_data).count).to eq 21
  end
end

RSpec.describe "#score" do
  it "returns the number of trees between the current tree and the tallest tree in a defined direction" do
    visible_tree = Tree.new(2, 1, 5)
    test_data = [3, 5, 3]
    
    expect(score(test_data, visible_tree)).to eq 2
  end

  it "returns the number of trees between the current tree and the edge to the right" do
    visible_tree = Tree.new(2, 1, 5)
    test_data = [1, 2]
    
    expect(score(test_data, visible_tree)).to eq 2
  end
  
  it "returns the number of trees between the current tree and the edge to the right" do
    visible_tree = Tree.new(2, 1, 5)
    test_data = [1, 2]
    
    expect(score(test_data, visible_tree)).to eq 2
  end
end

RSpec.describe "#scenic_score" do
  it "returns the scenic scores for the visible trees on the map" do
    path = "spec/data/day_8/input.txt"
    test_data = Input.new(path).to_coordinates

    expect(scenic_score(test_data)).to eq({
      "0:0" => 0, "1:0" => 0, "2:0" => 0, "3:0" => 0, "4:0" => 0, 
      "0:1" => 0, "1:1" => 1, "2:1" => 4, "4:1" => 0, 
      "0:2" => 0, "1:2" => 6, "3:2" => 2, "4:2" => 0, 
      "0:3" => 0, "2:3" => 8, "4:3" => 0, 
      "0:4" => 0, "1:4" => 0, "2:4" => 0, "3:4" => 0, "4:4" => 0
    })
  end
end