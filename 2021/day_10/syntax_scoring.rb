# https://adventofcode.com/2021/day/10

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_10/input.txt'
lines = Input.new(path).to_str_array

CHUNKS = {
  '(' => ')', 
  '[' => ']', 
  '{' => '}', 
  '<' => '>'
}

def check(lines)
  corrupted = {}
  incomplete = {}

  lines.each do |line|
    signals = line.split('')
    pushed = []
    
    signals.each do |signal|
      # binding.pry
      if CHUNKS.keys.include? signal 
        pushed << signal 
      else
        if signal != CHUNKS[pushed.last] # mark the line as corrupted
          # p "signal #{signal} - last pushed match #{CHUNKS[pushed.last]}"
          corrupted.merge!(line => signal)
          break
        else
          pushed.pop
        end
      end
    end

    incomplete.merge!(line => pushed) unless corrupted.include? line
  end

  return corrupted, incomplete
end

def calculate_corruption_score(corrupted_lines)
  score = 0

  corrupted_lines.each do |_, v|
    case v
    when ')'
      score += 3
    when ']'
      score += 57
    when '}'
      score += 1197
    when '>'
      score += 25137
    end
  end

  score
end

def calculate_line_score(line)
  total = 0

  line.each do |v|
    total *= 5
    
    case v
    when '('
      total += 1
    when '['
      total += 2
    when '{'
      total += 3
    when '<'
      total += 4
    end
  end

  total
end

def calculate_incomplete_score(incomplete_lines)
  scores = []
  
  incomplete_lines.each do |_, line|
    scores << calculate_line_score(line.reverse)
  end

  scores = scores.sort
  middle = (scores.size / 2)
  scores[middle]  
end

corrupted_lines, incomplete_lines = check(lines)
p calculate_corruption_score(corrupted_lines)

p calculate_incomplete_score(incomplete_lines)