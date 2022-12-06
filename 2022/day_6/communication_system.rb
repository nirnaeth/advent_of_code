# https://adventofcode.com/2022/day/6

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_6/input.txt"
transmission = Input.new(path).to_chr_array

def start?(sequence)
  sequence.count == sequence.uniq.count
end

def packet_position(transmission)
  transmission.each_index do |index|
    return index + 4 if start?(transmission[index, 4])
  end
end

def message_position(transmission)
  transmission.each_index do |index|
    return index + 14 if start?(transmission[index, 14])
  end
end

p packet_position(transmission)
p message_position(transmission)