#$LOAD_PATH << './lib'
require 'input.rb'

RSpec.describe Input do
  describe "#to_array" do
    it "reads from disk into an array" do
      path = "#{File.expand_path File.dirname(__FILE__)}../support/input.txt"
      source = Input.new(path)

      day_input = source.to_array

      expect(day_input).to eq [1721, 979, 366, 299, 675, 1456]
    end
  end
end
