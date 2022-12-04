# https://adventofcode.com/2022/day/3

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_3/input.txt"

PRIORITIES = ("a".."z").to_a + ("A".."Z").to_a
rucksacks = Input.new(path).to_str_array

def compartments_diff(rucksack)
  first = rucksack[0, rucksack.length / 2].chars 
  second = rucksack[rucksack.length / 2, rucksack.length].chars

  (first & second).pop
end

def priority(item)
  PRIORITIES.index(item) + 1
end

def total_priority(rucksacks)
  # version 1
  # [].tap do |a|
  #   rucksacks.each { |r| a << priority(compartments_diff(r)) }
  # end.sum 

  # version 2
  rucksacks.reduce(0) { |sum, r| sum + priority(compartments_diff(r)) }
end

p total_priority(rucksacks)

def badge(rucksacks)
  (rucksacks[0].chars & rucksacks[1].chars & rucksacks[2].chars).pop
end

def badge_priority(rucksacks)
  [].tap do |a|
    rucksacks.each_slice(3) { |group| a << priority(badge(group)) }
  end.sum
end

p badge_priority(rucksacks)