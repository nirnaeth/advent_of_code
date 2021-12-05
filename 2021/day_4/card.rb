require "pry"
class Card
  attr_reader :values
  attr_reader :bingo

  def initialize(values)
    @values = values
    @bingo = false
  end

  def mark(number)
    values.each do |line| 
      line.delete(number)

      @bingo = true if line.empty?
    end
  end

  def bingo?
    bingo
  end
end