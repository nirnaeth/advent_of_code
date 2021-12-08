# https://adventofcode.com/2021/day/7

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_7/input.txt'
crabs = Input.new(path).to_int_array(',')

# solution found here https://www.reddit.com/r/adventofcode/comments/rar7ty/2021_day_7_solutions/hnmydnl/
# for y in range(min(crabs),max(crabs)):
#   cost1 = min(cost1,sum([abs(x-y) for x in crabs]))
#   cost2 = min(cost2,sum([(abs(x-y)*(abs(x-y)+1)//2) for x in crabs]))

# similar # https://www.reddit.com/r/adventofcode/comments/rar7ty/2021_day_7_solutions/

cost_1 = Float::INFINITY
cost_2 = Float::INFINITY

(crabs.min..crabs.max).each do |y|
  sum_1 = 0
  crabs.each do |x|
    sum_1 += (x - y).abs
  end

  sum_2 = 0
  crabs.each do |x|
    sum_2 += ((x - y).abs * ((x - y).abs + 1) / 2)
  end

  cost_1 = [cost_1, sum_1].min
  cost_2 = [cost_2, sum_2].min
end

p cost_1
p cost_2
# -------------- BRUTE FORCE #1
# def find_distances(crabs)
#   max_distance = crabs.max + 1

#   [].tap do |distances|
#     (0..max_distance).each do |target|
#       distances[target] = []

#       crabs.each do |position|
#         distance = position - target
#         distances[target] << distance
#       end
#     end
#   end
# end

# distances = find_distances(crabs)

# def min_distance(distances)
#   steps = []
#   distances.each do |distance|
#     steps << distance.sum
#   end

#   min = 0

#   [].tap do |absolute_distances|
#     steps.each do |current|
#       absolute_distances << (0 - current).abs
#     end

#     min = absolute_distances.min
#   end.find_index(min)
# end

# min = min_distance(distances)

# def calculate_fuel(steps)
#   fuel = 0
  
#   steps.each do |n|
#     n = n.abs
#     fuel += (n * (n + 1)) / 2
#   end

#   fuel
# end

# calculate_fuel(distances[min])

# -------------- BRUTE FORCE #2
# def calculate_fuel(crabs)
#   [].tap do |consumptions|
#     (0..crabs.max).each do |n|
#       [].tap do |fuels|
#         crabs.each do |crab|
#           distance = (crab - n)
#           # fuels << gaussian_sum(distance)
#           fuels << distance
#         end
#         consumptions << fuels
#       end
#     end
#     # binding.pry
    
#     [].tap do |test|
#       consumptions.each do |c|
#         test << c.sum
#       end

#       binding.pry
      
#       [].tap do |values|
#         test.min.each do |c|
#           gaussian_sum(c)
#         end

#         values.sum
#       end
#     end
#   end
# end

# calculate_fuel(crabs)

# --------- MATH SOLUTION
# https://www.reddit.com/r/adventofcode/comments/rar7ty/2021_day_7_solutions/hnkd58g/?context=3
# def blast_position(crabs)
#   (crabs.sum.to_f / crabs.size.to_f)
# end

# position = blast_position(crabs)

# def gaussian_sum(n)
#   (n * (n + 1)) / 2
# end

# def calculate_fuel(crabs, position)
#   [].tap do |distances|
#     crabs.each do |crab|
#       distance = (crab - position).abs
#       distance = if (crab - position) > 0
#         distance.floor
#       else
#         distance.ceil
#       end
#       
#       distances << gaussian_sum(distance)
#     end
#   end.sum
# end

# p calculate_fuel(crabs, position)
