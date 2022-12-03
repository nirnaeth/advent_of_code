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

# def list_neighbours(map)
#   {}.tap do |paths|
#     map.each do |connection|
#       pair = connection.split('-')

#       all = pair.zip(pair.reverse)
    
#       all.each do |from, to|
#         unless to == 'start' || from == 'end'
#           paths[from].nil? ? paths[from] = [to] : paths[from] << to 
#         end
#       end
#     end
#   end
# end

# paths = list_paths(map)

def list_neighbours(map)
  {}.tap do |neighbours|
    map.each do |line|
      caves = line.split('-')
    
      caves.each do |cave| # check both ways, from and to
        next_cave = (caves - [cave]).pop # identify other cave compared to the current one

        # - if we are at end, we are at the border of the graph, so no need to find neighbours
        # - going to the start is an illegal move
        if cave != 'end' && next_cave != 'start'
          if neighbours[cave].nil? # never visited this cave, initialize new array element
            neighbours[cave] = [next_cave]
          else
            neighbours[cave] << next_cave
          end
        end
      end
    end
  end
end

# paths = list_neighbours(map)

# p paths

def valid_complete_paths(neighbours, visited)
  count = 0 
p "visited #{visited}"
p "neighbours #{neighbours}"

p "neighbours last #{visited.last}"
p "neighbours last #{neighbours[visited.last]}"
  frontier_caves = neighbours[visited.last]
  
  frontier_caves.each do |cave|    
    if cave.upcase == cave || !visited.include?(cave)
      p "cannot progress"
      p "cave #{cave}"
      # binding.pry
      if cave == 'end'
        count += 1
      else
        p "can progress"
        p "cave #{cave}"
        valid_complete_paths(neighbours, visited << cave)
      end
    end
  end

  count
end


for a,b in maps:
    graph[a].add(b)
    graph[b].add(a)

def traverse(path=['start']):
    if path[-1] == 'end': return 1
    newnodes = [node for node in graph[path[-1]] if node not in path or node.upper()==node]
    if len(newnodes)==0: return 0
    return sum([traverse(path=path+[node]) for node in newnodes])

# p valid_complete_paths(paths, ['start'])

# # def part1(paths, visited)
# #   final = 0

# #   paths[visited.last].each do |cave|
# #     # binding.pry
# #     if cave.upcase == cave || !visited.include?(cave)
# #       if cave == 'end'
# #         final += 1  
# #       else 
# #         part1(paths, visited << cave)
# #       end
# #     end
# #   end

# #   final
# # end

# #   p part1(paths, ['start'])