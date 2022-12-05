# https://adventofcode.com/2020/day/5

$LOAD_PATH << './lib'
require "input.rb"
path = "support/input_day_5.txt"

boarding_passes = Input.new(path).to_str_array