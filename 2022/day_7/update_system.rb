# https://adventofcode.com/2022/day/6

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_7/input.txt"
commands = Input.new(path).to_str_array

MAX_SIZE = 100000

def add_nodes(commands, parent)
  nodes = []
  line = commands.shift

  while line && !line.start_with?("$")
    if line.start_with?("dir")
      name = line.split(" ").last
      size = 0
    else
      file_data = line.split(" ")
      name = file_data.last
      size = file_data.first
    end

    nodes << {
        name => {
        "parent" => parent,
        "children" => [],
        "size" => size.to_i
      }
    }

    line = commands.shift
  end

  nodes
end

def filesystem(commands, structure = {}, parent = nil)
  command = commands.shift

  if command == "$ ls"
    structure[parent]["children"] = add_nodes(commands, parent)
  end
  
  if command.start_with? "$ cd"
    location = command.split(" ").last

    if location == "/"
      structure.store("/", {
        "parent" => "/",
        "children" => [],
        "size" => 0
      })
  
      binding.pry
      
    elsif location == ".."
      # todo
    else
      binding.pry
      structure[location]["children"] = add_nodes(commands, location)
    end

    filesystem(commands, structure, location) unless commands.empty?
  end

  structure

  # {}.tap do |h|
  #   commands.each do |line|
  #     if line == "$ ls"
  #       next
  #     elsif line == "$ cd /"
  #       h.store("/", {})
  #     elsif line.start_with?("$ cd ")
  #       location = line.split(" ")[2]
  #       h.store(location, {})
  #     elsif line.start_with?("dir ")
  #       _, location = line.split(" ")
  #       h.store(location, {})
  #     end
  #   end
  # end
end

