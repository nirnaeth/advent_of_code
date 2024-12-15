# https://adventofcode.com/2024/day/2

$LOAD_PATH << './lib'
require "input.rb"
path = "day_2/data/input.txt"
reports = Input.new(path).to_int_matrix("\n")

def is_safe?(report)
  # not safe if not all increasing or all decreasing
  return false if (report != report.sort && report.reverse != report.reverse.sort)

  # not safe if there are levels with the same degree
  return false if (report != report.uniq) #

  report.each_with_index do |level, index|
    # safe if we are at the end of the array
    return true if index + 1 == report.size

    # safe as long as the result is increasing or decreasing between 1 and 3
    return false unless (1..3).cover? (level - report[index+1]).abs
  end
end

def safe_reports(reports)
  reports.select { |r| is_safe?(r) }.count
end
