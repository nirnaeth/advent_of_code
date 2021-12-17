require './day_10/syntax_scoring'
require 'pry'

RSpec.describe '#check' do
  it 'finds the corrupted lines' do
    path = 'spec/support/day_10/input.txt'
    lines = Input.new(path).to_str_array
    
    result, _ = check(lines)
    expect(result).to eq corrupted_lines
  end

  it 'finds the incomplete lines' do
    path = 'spec/support/day_10/input.txt'
    lines = Input.new(path).to_str_array
    
    _, result = check(lines)
    expect(result).to eq incomplete_lines
  end
end

RSpec.describe '#calculate_score' do
  it 'calculates the syntax error score for the corrupted lines' do
    expect(calculate_corruption_score(corrupted_lines)).to eq 26397
  end
end

def corrupted_lines
  {
    '{([(<{}[<>[]}>{[]{[(<()>' => '}', 
    '[[<[([]))<([[{}[[()]]]'   => ')', 
    '[{[{({}]{}}([{[{{{}}([]'  => ']', 
    '[<(<(<(<{}))><([]([]()'   => ')', 
    '<{([([[(<>()){}]>(<<{{'   => '>'
  }
end

def incomplete_lines
  [
    "[({(<(())[]>[[{[]{<()<>>", 
    "[(()[<>])]({[<{<<[]>>(", 
    "(((({<>}<{<{<>}{[]{[]{}", 
    "{<[[]]>}<{[{[{[]{()[[[]", 
    "<{([{{}}[<[[[<>{}]]]>[]]"
  ]
end
