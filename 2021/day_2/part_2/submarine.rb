require "pry"

class Submarine
  Position = Struct.new(:x, :y)

  attr_reader :position

  def initialize
    @position = Position.new(0, 0)
  end

  def move(directions)
    case directions.first
    when :forward
      position.x += directions.last
    when :down
      position.y += directions.last
    when :up
      position.y -= directions.last
    end
  end

  private

    attr_writer :position
end