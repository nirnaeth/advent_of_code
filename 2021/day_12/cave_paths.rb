# https://adventofcode.com/2021/day/12

$LOAD_PATH << './lib'
require 'input'
require_relative 'cave'
require 'pry'

path = 'support/day_12/input.txt'

map = Input.new(path).to_str_array

# find the number of distinct paths that start at start, end at end and don't visit small caves more than once

# big caves (written in uppercase, like A) and small caves (written in lowercase, like b)
# all paths you find should visit small caves at most once, and can visit big caves any number of times

# How many paths through this cave system are there that visit small caves at most once?

# p connections

# def list_paths(map)
#   {}.tap do |paths|
#     map.each do |connection|
#       pair = connection.split('-')

#       all = pair.zip(pair.reverse)
    
#       all.each do |from, to|
#         unless to == 'start' #|| from == 'end'
#           paths[from].nil? ? paths[from] = [to] : paths[from] << to 
#         end
#       end
#     end
#   end
# end

def list_caves_paths(map)
  {}.tap do |neighbours|
    map.each do |line|
      from, to = line.split('-')
    
      neighbours[from].nil? ? neighbours[from] = [to] : neighbours[from] << to
    end
  end
end

# paths = list_caves_paths(map)

# def part1(paths, visited)
#   final = 0

#   paths[visited.last].each do |cave|
#     # binding.pry
#     if cave.upcase == cave || !visited.include?(cave)
#       if cave == 'end'
#         final += 1  
#       else 
#         part1(paths, visited << cave)
#       end
#     end
#   end

#   final
# end

#   p part1(paths, ['start'])
