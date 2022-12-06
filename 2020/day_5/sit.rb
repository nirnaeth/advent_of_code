# https://adventofcode.com/2020/day/5

$LOAD_PATH << './lib'
require "input.rb"
path = "support/input_day_5.txt"

boarding_passes = Input.new(path).to_str_array

def parse(boarding_pass)
  rows = boarding_pass[0, 7] 
  columns = boarding_pass[7, 3]
  return rows, columns
end

def row(sequence, min: 0, max: 127)
  sequence.each_char do |c|
    case c
    when "F"
      min = min
      max -= ((max - min) / 2.0).ceil
    when "B"      
      min += ((max - min) / 2.0).ceil
      max = max
    end

    sequence.delete_prefix!(c)
    if min == max
      return max
    else
      row(sequence, min: min, max: max)
    end
  end
end

def column(sequence, min: 0, max: 7)
  sequence.each_char do |c|
    case c
    when "L"
      min = min
      max -= ((max - min) / 2.0).ceil
    when "R"      
      min += ((max - min) / 2.0).ceil
      max = max
    end

    sequence.delete_prefix!(c)
    if min == max
      return max
    else
      row(sequence, min: min, max: max)
    end
  end
end

def seat(row, column)
  row * 8 + column
end

def highest_seat(passes)
  [].tap do |a|
    passes.each do |pass|
      rows, columns = parse(pass)
      row_number = row(rows)
      column_number = column(columns)
      
      a << seat(row_number, column_number)
    end
  end.max
end

p highest_seat(boarding_passes)