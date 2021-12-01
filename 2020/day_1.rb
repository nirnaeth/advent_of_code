$LOAD_PATH << './lib'
require "input.rb"
require "benchmark.rb"

path = "support/input_day_1.txt"
source = Input.new(path).to_int_array

def add_two_to_2020(source)
  to_2020 = source.map { |n| 2020 - n }
  source & to_2020
end

def add_three_to_2020(source)
  source.
    combination(3).
    each do |a|
      return a if a.reduce(:+) == 2020
    end
end

add_two_to_2020(source).reduce(:*)

add_three_to_2020(source).reduce(:*)


# Performance

# Benchmark.bm do |benchmark|
#   benchmark.report("add_three_to_2020_v1") do
#     1000.times do
#       add_three_to_2020_v1(source)
#     end
#   end
#
#   benchmark.report("add_three_to_2020_v2") do
#     1000.times do
#       add_three_to_2020_v2(source)
#     end
#   end
# end
#
## v2 is the current implementation
## v1 is the following
#
# def add_three_to_2020_v1(source)
#   source.
#     combination(3).
#     select { |a| a.reduce(:+) == 2020 }.
#     pop
# end
#                     user          system      total        real
# add_three_to_2020_v 1313.029497   1.150669 314.180166 (321.840970)
# add_three_to_2020_v2 201.160744   1.297168 202.457912 (209.742722)
#
#
# Benchmark.bm do |benchmark|
#   benchmark.report("add_two_to_2020_v1") do
#     20_000.times do
#       add_two_to_2020_v1(source)
#     end
#   end
#
#   benchmark.report("add_two_to_2020_v2") do
#     20_000.times do
#       add_two_to_2020_v2(source)
#     end
#   end
# end
#
#                     user        system     total        real
# add_two_to_2020_v1  0.616152   0.014376   0.630528 (  0.661044)
# add_two_to_2020_v2 95.323969   0.547298  95.871267 (102.092802)
#
# I was wondering if reusing the same implementation for both methods.
# Nope, don't do that
