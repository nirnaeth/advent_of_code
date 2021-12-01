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
  position_one, position_two, letter, password = separate(item)

  (password[position_one - 1] + password[position_two - 1]).count(letter) == 1
end

def separate(item)
  matches = /(?<one>\d+)-(?<two>\d+) (?<char>.): (?<password>[a-z]+)/.match(item)

  return matches["one"].to_i, matches["two"].to_i, matches["char"], matches["password"]
end

p number_of_valid_passwords(source)
