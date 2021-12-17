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
  {}.tap do |corrupted|
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
    end
  end
end

def calculate_score(corrupted_lines)
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

corrupted_lines = check(lines)
p calculate_score(corrupted_lines)