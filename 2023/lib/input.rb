require 'pry'

class Input
  def initialize(path)
    path = File.expand_path(File.dirname(__FILE__) + '/../' + path)
    @file = File.new(path, "r")
  end

  def to_int_array(separator = "\n")
    file.read.split(separator).map(&:to_i)
  end

  def to_str_array(separator = "\n")
    file.read.split(separator)
  end

  def to_chr_array
    file.read.chars
  end

  def to_bit_matrix
    [].tap do |matrix|
      to_str_array.each do |line|
        matrix << line.split('').map(&:to_i)
      end
    end
  end

  def to_coordinates
    {}.tap do |matrix|
      to_bit_matrix.each_with_index do |row, y| 
        row.each_with_index do |element, x|
          matrix.merge!("#{x}:#{y}" => element)
        end
      end
    end
  end

  private

    attr_reader :file
end
