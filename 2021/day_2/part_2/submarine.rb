require "pry"

class Submarine
  Position = Struct.new(:x, :y, :aim)

  attr_reader :position

  def initialize
    @position = Position.new(0, 0, 0)
  end

  def move(directions)
    case directions.first
    when :forward
      position.x += directions.last
      position.y += position.aim * directions.last 
    when :down
      position.aim += directions.last
    when :up
      position.aim -= directions.last
    end
  end

  private

    attr_writer :position
end