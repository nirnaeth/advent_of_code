require "pry"
require "./day_7/update_system.rb"

RSpec.describe "#filesystem" do
  it "initializes the directory with the root" do
    test_data = ["$ cd /"]

    expect(filesystem(test_data)).to eq({ 
      "/" => { 
        "parent" => "/", 
        "children" => [], 
        "size" => 0 
      } 
    })
  end

  it "adds a directory to the content of its parent" do
    test_data = [
      "$ cd /",
      "$ ls",
      "dir a"
    ]

    expect(filesystem(test_data)).to eq({
      "/" => { 
        "parent" => "/", 
        "children" => [
          "a" => { 
            "parent" => "/", 
            "children" => [], 
            "size" => 0 
          }
        ], 
        "size" => 0 
      } 
    })
  end

  it "adds a file to the content of its parent" do
    test_data = [
      "$ cd /",
      "$ ls",
      "14848514 b.txt"
    ]
    
    expect(filesystem(test_data)).to eq({
      "/" => { 
        "parent" => "/", 
        "children" => [
          "b.txt" => { 
            "parent" => "/", 
            "children" => [], 
            "size" => 14848514
          }
        ], 
        "size" => 0 
      } 
    })
  end
  
  it "navigates deeper" do
    test_data = [
      "$ cd /",
      "$ ls",
      "dir a",
      "$ cd a",
      "$ ls",
      "dir e"
    ]
    
    expect(filesystem(test_data)).to eq({
      "/" => { 
        "parent" => "/", 
        "children" => [
          "a" => { 
            "parent" => "/", 
            "children" => [
              "e" => { 
                "parent" => "a", 
                "children" => [], 
                "size" => 0 
              }
            ], 
            "size" => 0 
          }
        ], 
        "size" => 0 
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
