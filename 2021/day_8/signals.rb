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

# -------------- PART 1
# input
# {
#  signals: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb', 'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'], 
#  output: ['gbdfcae', 'bgc', 'cg', 'cgb']
# }
def find_uniques(signals)
  values = Array.new(10)
  # signals.select { |item| [2, 3, 4, 7].include? item.size }
  signals.each do |signal|
    case signal.size
    when 2
      values[1] = signal
    when 3
      values[7] = signal
    when 4
      values[4] = signal
    when 7
      values[8] = signal
    end
  end

  values
end

def decode(input)
  # binding.pry
  eight = input[:signals].select { |item| item.size == 7 }.pop
  display = Display.new(eight)
  dictionary = display.decode_wires

  decoded_displays = []
  input[:output].each do |value|
    corrected_value = []
    value.chars.each { |c| corrected_value << dictionary[c] }
    # binding.pry
    decoded_displays << display.number(corrected_value.sort.join)
  end
  
  decoded_displays
end

# -------------- PART 1
# input
# {
#  signals: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb', 'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'], 
#  output: ['gbdfcae', 'bgc', 'cg', 'cgb']
#}
# def decode(input)
#   # binding.pry
#   eight = input[:signals].select { |item| item.size == 7 }.pop
#   display = Display.new(eight)
#   dictionary = display.decode_wires

#   decoded_displays = []
#   input[:output].each do |value|
#     corrected_value = []
#     value.chars.each { |c| corrected_value << dictionary[c] }
#     # binding.pry
#     decoded_displays << display.number(corrected_value.sort.join)
#   end
  
#   decoded_displays
# end

# def count_unique_numbers(input)
#   occurrences = 0
  
#   input.each do |value|
#     number = decode(value)
#     occurrences += number.count { |element| [1, 4, 7, 8].include? element }
#   end

#   occurrences
# end

# def decode(input)
#   # binding.pry
#   eight = input[:signals].select { |item| item.size == 7 }.pop
#   display = Display.new(eight)
#   dictionary = display.decode_wires

#   # binding.pry
#   decoded_displays = []
#   input[:output].each do |value|
#     binding.pry
#     # TODO: order decoded wires? they are anagrams
    
#     value.size

#     decoded_displays << display.number(dictionary[value.chars.sort.join])
#   end
  
#   decoded_displays
# end

# def decode(input)
#   # binding.pry
#   eight = input[:signals].select { |item| item.size == 7 }.pop
#   display = Display.new(eight)
#   dictionary = display.decode_wires

#   # binding.pry
#   decoded_displays = []
#   input[:output].each do |value|
#     binding.pry
#     # TODO: order decoded wires? they are anagrams
    
#     decoded_displays << display.number(dictionary[value.chars.sort.join])
#   end
  
#   decoded_displays
# end

# def count_unique_numbers(input)
#   occurrences = 0
  
#   input.each do |value|
#     number = decode(value)
#     occurrences += number.count { |element| [1, 4, 7, 8].include? element }
#   end

#   occurrences
# end

# # input = read_input(path)
# # p count_unique_numbers(input)

# # -------------- PART 2

# def anagram?(from, to)
#   from.chars.sort == to.chars.sort
# end