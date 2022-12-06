# https://adventofcode.com/2022/day/6

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_6/input.txt"
transmission = Input.new(path).to_chr_array

def packet_start?(sequence)
  sequence.count == sequence.uniq.count
end

def marker_position(transmission)
  transmission.each_index do |index|
    return index + 4 if packet_start?(transmission[index, 4])
  end
end

p marker_position(transmission)