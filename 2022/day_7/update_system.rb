# https://adventofcode.com/2022/day/6

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_7/input.txt"
commands = Input.new(path).to_str_array

MAX_SIZE = 100000

def filesystem(commands)
  {}.tap do |h|
    commands.each do |line|
      if line == "$ ls"
        next
      elsif line.start_with?("$ cd ")
        location = line.split(" ")[2]
        h.store(location, {})
      end
    end
  end
end

