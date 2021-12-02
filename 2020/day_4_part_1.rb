$LOAD_PATH << './lib'
require "input"
require "pry"

path = "support/input_day_4.txt"
source = Input.new(path)

binding.pry