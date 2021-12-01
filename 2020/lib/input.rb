class Input
  def initialize(path)
    path = File.expand_path(File.dirname(__FILE__) + '/../' + path)
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
