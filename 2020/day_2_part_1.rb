$LOAD_PATH << './lib'
require "input.rb"

path = "support/input_day_2.txt"
source = Input.new(path).to_str_array

def number_of_valid_passwords(source)
  valid_passwords(source).count
end

def valid_passwords(source)
  source.select { |item| valid?(item) }
end

def valid?(item)
  min, max, letter, password = separate(item)

  (min..max).include?(password.count(letter))
end

def separate(item)
  matches = /(?<min>\d+)-(?<max>\d+) (?<char>.): (?<password>[a-z]+)/.match(item)

  return matches["min"].to_i, matches["max"].to_i, matches["char"], matches["password"]
end

p number_of_valid_passwords(source)
