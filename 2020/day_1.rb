$LOAD_PATH << './lib'
require "input.rb"
require "benchmark.rb"

path = "#{File.expand_path File.dirname(__FILE__)}/support/input_day_1.txt"
source = Input.new(path).to_array

def add_two_to_2020(source)
  to_2020 = source.map { |n| 2020 - n }
  source & to_2020
end

def add_three_to_2020(source)
  source.
    combination(3).
    select { |a| a.reduce(:+) == 2020}.
    pop
end

add_two_to_2020(source).reduce(:*)

add_three_to_2020(source).reduce(:*)

# Benchmark.bm do |benchmark|
#   benchmark.report("add_two_to_2020_v1") do
#     20_000.times do
#       add_two_to_2020_v1(source)
#     end
#   end

#   benchmark.report("add_two_to_2020_v2") do
#     20_000.times do
#       add_two_to_2020_v2(source)
#     end
#   end
# end
#
# I was wondering if reusing the same implementation for both methods.
# Nope, don't do that
#                     user        system     total        real
# add_two_to_2020_v1  0.616152   0.014376   0.630528 (  0.661044)
# add_two_to_2020_v2 95.323969   0.547298  95.871267 (102.092802)
