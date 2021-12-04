require "pry"
# https://adventofcode.com/2021/day/2

# 00100
# 11110
# 10110
# 10111
# 10101
# 01111
# 00111
# 11100
# 10000
# 11001
# 00010
# 01010

# power consumption = gamma rate * epsilon rate in decimal
# gamma rate = most common bit in the position from numbers in report
# ex. position 1, most common 1 (7 ones, 5 zeroes) 
# gamma rate = 10110 in binary = 22 in decimal

# epsilon rate = least common bit in the position from numbers in report
# ex. position 1, least common 0 (7 ones, 5 zeroes)
# epsilon rate = 01001 in binary = 9 in decimal

# power consumption = 22 * 9 = 198

$LOAD_PATH << './lib'
require "input"

path = "support/day_3/input.txt"
readings = Input.new(path).to_bit_matrix

def find_rates(values)
  matrix = values.transpose

  gamma_rate = ""
  epsilon_rate = ""

  matrix.each do |row|
    ones = row.count(1)
    zeroes = row.count(0)

    if ones > zeroes 
      gamma_rate << "1"
      epsilon_rate << "0"
    else
      gamma_rate << "0"
      epsilon_rate << "1"
    end
  end

  return gamma_rate.to_i(2), epsilon_rate.to_i(2)
end

def power_consumption(values)
  gamma_rate, epsilon_rate = find_rates(values)

  gamma_rate * epsilon_rate
end

power_consumption(readings)

# life support rating = oxygen generation rating * CO2 scrubber rating
# For each bit
# 1. Keep only numbers selected by the bit criteria for the type of rating value for which you are searching. 
#    Discard numbers which do not match the bit criteria.
# 2. If you only have one number left, stop; this is the rating value for which you are searching.
# 3. Otherwise, repeat the process, considering the next bit to the right.

# oxygen generation rating
# bit criteria: find the most common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix). 
# if 0 and 1 are equally common, keep the 1s

# CO2 scrubber rating
# bit criteria: find the least common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix).
# if 0 and 1 are equally common, keep the 0s

def most_common_bit(row)
  ones = row.count(1)
  zeroes = row.count(0)

  ones >= zeroes ? 1 : 0
end

def least_common_bit(row)
  1 - most_common_bit(row)
end

# SOLUZIONE 1
def ratings(gas, report)
  bits = report.transpose

  [].tap { |filter|
    # for each row in the transposed matrix, find the most or least common and 
    # append it to an array that will become the filter for the readings
    bits.each { |row| filter << (gas == :oxygen ? most_common_bit(row) : least_common_bit(row)) }

    # for each item in the filter in a specific position,
    # collect only the rows that have at that specific position a value
    # matching that of the filter 
    filter.each_with_index do |selector, index|
      report = report.select { |row| row[index] == selector } # use the new collection to iterate on next 
      break if report.count == 1
    end
  }
end

p ratings(:oxygen, readings).join.to_i(2)
p ratings(:co2, readings).join.to_i(2)
p ratings(:oxygen, readings).join.to_i(2) * ratings(:co2, readings).join.to_i(2)

# SOLUZIONE 2

def oxygen(report)
  bits = report.transpose

  [].tap { |filter|
    bits.each { |row| filter << most_common_bit(row) }

    filter.each_with_index do |selector, index|
      report = report.select { |row| row[index] == selector }
      return report.pop if report.count == 1
    end
  }
end

def co2(report)
  bits = report.transpose

  [].tap { |filter|
    bits.each { |row| filter << least_common_bit(row) }

    filter.each_with_index do |selector, index|
      report = report.select { |row| row[index] == selector }
      return report.pop if report.count == 1
    end
  }
end

p oxygen(readings).join.to_i(2)
p co2(readings).join.to_i(2)
p oxygen(readings).join.to_i(2) * co2(readings).join.to_i(2)
