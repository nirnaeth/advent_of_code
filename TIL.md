# TIL 

## What I learned (or recalled) thanks to [Advent of Code](adventofcode.com/)

### 2023
Language: Ruby

**Day 1**
TIL about
* Capturing groups and lookahead in regexp

> In regular expressions, checking for overlapping strings (also known as overlapping matches) can be challenging because once a portion of the string is matched, it is consumed, and the regex engine moves forward in the input string. This means that the same portion of the string cannot be part of multiple matches.

```ruby
input_string = "ababab"
pattern = /(?=(aba))/

matches = []
input_string.scan(pattern) do
  matches << Regexp.last_match[1]
end

puts "Overlapping Matches: #{matches}"

```
> In this example, the regex pattern (?=(aba)) uses a positive lookahead to find occurrences of "aba" in the input string. The capturing group (aba) captures the matched portion. 

[Understanding negative and positive lookahead](https://stackoverflow.com/a/27691287)

**Day 2**

I should have not chosen that kind of data structure for storing the games.
Probably using the colors as keys and associating game / hand / number might 
have ended up in fewer cycles.

I should have also found a way to initialize the keys that weren't present once 
so to avoid using .fetch all the time.

### 2022
Language: Ruby

**Day 1**
TIL about
* [Sorting arrays in reverse order](https://www.rubyguides.com/2017/07/ruby-sort/)
```ruby
.sort_by { |calories| -calories }
```

### 2021
Language: Ruby

**Day 12**
TIL about
* [BFS & DFS](https://medium.com/tebs-lab/breadth-first-search-and-depth-first-search-4310f3bf8416)
* [RSpec 3 composable matchers](https://rspec.info/blog/2014/01/new-in-rspec-3-composable-matchers/)

**Day 10**
TIL about 
* [Flood Fill Algorithm](https://en.m.wikipedia.org/wiki/Flood_fill)
* use an hash to represent a matrix: for each element, the key is the coordinates, the value is the element itself

**Day 7**
TIL about
* [Geometric median](https://en.wikipedia.org/wiki/Geometric_median) as minimizing distances
* [sum of the first n numbers](https://iq.opengenus.org/sum-of-first-n-numbers/)

### 2020
Language: Ruby

**Day 5**
TIL about
* [BSP - Binary Sace Partitioning](https://en.wikipedia.org/wiki/Binary_space_partitioning) [Tutorial](https://www.cs.cmu.edu/afs/andrew/scs/cs/15-463/2001/pub/www/notes/bsp_tutorial.pdf)