class Input
  def initialize(path)
    @file = File.new(path, "r")
  end

  def to_int_array
    file.read.split("\n").map(&:to_i)
  end

  def to_str_array
    file.read.split("\n")
  end

  private

    attr_reader :file
end
