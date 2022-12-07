require "pry"
require "./day_7/update_system.rb"

RSpec.describe "#filesystem" do
  it "ignores the ls command" do
    test_data = ["$ ls"]
    
    expect(filesystem(test_data)).to eq({})
  end

  it "initializes the directory with the root" do
    test_data = ["$ cd /"]

    expect(filesystem(test_data)).to eq({ "/" => {} })
  end

  it "adds a directory to the content of its parent" do
    test_data = [
      "$ cd /",
      "dir a"
    ]

    expect(filesystem(test_data)).to eq({
      "/" => {
        "a" => {}
      }
    })
  end

  xit "reproduces the filesystem from the set of instructions" do
    path = "spec/data/day_7/input.txt"
    test_data = Input.new(path).to_str_array

    expect(filesystem(test_data)).to match [
      a_hash_including("/": { "a": { "e": { "i": 584 }, "f": 29116, "g": 2557, "h.lst": 62596 } })
    ]
  end  
end
