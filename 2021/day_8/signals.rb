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
  eight = input[:signals].select { |item| item.size == 7 }.pop
  dictionary = Display.new(eight).match_wires

  decoded_displays = []
  input[:output].each do |value|
    corrected_value = []
    value.chars.each { |c| corrected_value << dictionary[c] }
    decoded_displays << Display.new(corrected_value.sort.join).number
  end
  
  decoded_displays
end

def count_unique_numbers(input)
  occurrences = 0
  
  input.each do |value|
    number = decode(value)
    occurrences += number.count { |element| [1, 4, 7, 8].include? element }
  end

  occurrences
end

# input = read_input(path)
# p count_unique_numbers(input)
