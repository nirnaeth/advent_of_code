# https://adventofcode.com/2021/day/12

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_12/input.txt'

connections = Input.new(path).to_str_array

START_POS = 'start'
END_POS = 'end'

# find the number of distinct paths that start at start, end at end and don't visit small caves more than once

# big caves (written in uppercase, like A) and small caves (written in lowercase, like b)
# all paths you find should visit small caves at most once, and can visit big caves any number of times

# How many paths through this cave system are there that visit small caves at most once?