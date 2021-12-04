require "pry"
class Card
  attr_reader :values
  
  def initialize(values)
    @values = values
  end

  def mark(number)
    values.each { |line| line.delete(number) }
  end

  private
    attr_writer :values
end