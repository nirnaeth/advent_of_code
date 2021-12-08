# https://adventofcode.com/2021/day/8

$LOAD_PATH << './lib'
require 'input'
require 'pry'
require_relative 'display'
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

# input
# {
#  signals: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb', 'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'], 
#  output: ['gbdfcae', 'bgc', 'cg', 'cgb']
#}
def decode(input)
  p input[:signals].sort { |a, b| a.size <=> b.size }
end

input = read_input(path)

