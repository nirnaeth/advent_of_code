$LOAD_PATH << './lib'
require "input.rb"

path = "#{File.expand_path File.dirname(__FILE__)}/support/input_day_1.txt"
source = Input.new(path).to_array

def adding_to_2020(source)
  to_2020 = source.map { |n| 2020 - n }
  source & to_2020
end

p adding_to_2020(source).reduce(:*)
