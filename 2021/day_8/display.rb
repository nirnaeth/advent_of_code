# https://adventofcode.com/2021/day/8

$LOAD_PATH << './lib'
require 'input'
require 'pry'
path = 'support/day_8/input.txt'

def read_input(path)
  file = File.new(path, 'r')

  lines = file.read.split("\n")

  [].tap do |values|
    lines.each do |line| 
      signals, output = line.split(' | ')
      values << {signals: signals.split(' '), output: output.split(' ')}
    end
  end
end

# position = blast_position(crabs)

# def calculate_fuel(crabs, position)
#   [].tap do |distances|
#     crabs.each do |crab|
#       distances << (crab - position).abs
#     end
#   end.sum
# end

# p calculate_fuel(crabs, position)
