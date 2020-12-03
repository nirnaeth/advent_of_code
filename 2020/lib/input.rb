class Input
  def initialize(path)
    @file = File.new(path, "r")
  end

  def read_to_array
    file.read.split("\n").map(&:to_i)
  end

  private

    attr_reader :file
end
