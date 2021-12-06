$LOAD_PATH << './lib'
require 'input'
require 'pry'
path = 'support/day_6/input.txt'

# each fish = number of days until it creates a new fish. constant = 7 days
# new fish = number of days until parent fish creates a new fish + 2

# day 0 single fish = 3
# day 1 single fish = 2 
# day 2 single fish = 1
# day 3 single fish = 0 <- spawn new fish
# day 4 single fish = 6 (7, offset by 1), new fish = 8

fishes = Input.new(path).to_int_array(',')
SPAWN_DAY = 0
RESET_DAY = 6
NEW_FISH = 9
# DAYS = 80

def setup(fishes)
  [].tap do |ledger|
    (0..8).each do |day|
      ledger[day] = fishes.count(day)
    end
  end
end

def grow(ledger, days)
  # binding.pry 
  days.times do |day|
    ledger.rotate!
  end

  # binding.pry 
  ledger
end

start_ledger = setup(fishes)
# starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# grow(fishes, days)

# p fishes.count
# ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# elapsed = ending - starting
# p elapsed * 60
