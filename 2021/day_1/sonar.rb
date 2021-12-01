# https://adventofcode.com/2021/day/1

$LOAD_PATH << './lib'
require "input.rb"
path = "support/day_1/input.txt"
measures = Input.new(path).to_int_array

def count_depth_increases(measures)
  measures.each_cons(2).select { |pair| pair.first < pair.last }.count
end

# p count_depth_increases(measures)

def count_depth_increases_in_triples(measures)
  []
    .tap { |a| measures.each_cons(3) { |triple| a << triple.sum } }
    .each_cons(2)
    .select { |pair| pair.first < pair.last }
    .count
end

p count_depth_increases_in_triples(measures)