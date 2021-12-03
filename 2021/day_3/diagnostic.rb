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
  matrix = to_matrix(values).transpose
  
  gamma_rate, epsilon_rate = find_rates(matrix)

  gamma_rate * epsilon_rate
end

p power_consumption(readings)