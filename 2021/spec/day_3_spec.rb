require "./day_3/diagnostic"

RSpec.describe "#ratings" do
# oxygen generation rating
# bit criteria: find the most common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix). 
# if 0 and 1 are equally common, keep the 1s
  context "for oxygen" do
    it "returns the number with the same most common bits across all bits" do
      path = 'spec/support/day_3/input.txt'
      readings = Input.new(path).to_bit_matrix

      expect(ratings(:oxygen, readings)).to eq [1, 0, 1, 1, 0]
    end
  end

# bit criteria: find the least common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix).
# if 0 and 1 are equally common, keep the 0s
  context "for co2" do
    it "returns the number with the same least common bits across all bits" do
      path = 'spec/support/day_3/input.txt'
      readings = Input.new(path).to_bit_matrix

      expect(ratings(:co2, readings)).to eq [1, 0, 1, 1, 1]
    end
  end
end

RSpec.describe "#oxygen" do
# oxygen generation rating
# bit criteria: find the most common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix). 
# if 0 and 1 are equally common, keep the 1s
  it "returns the number with the same most common bits across all bits" do
    path = 'spec/support/day_3/input.txt'
    readings = Input.new(path).to_bit_matrix

    expect(oxygen(readings)).to eq [1, 0, 1, 1, 0]
  end
end

RSpec.describe "#co2" do
# bit criteria: find the least common value in the current bit position (transposed matrix)
# and keep only numbers with that bit in that position (original matrix).
# if 0 and 1 are equally common, keep the 0s
  it "returns the number with the same least common bits across all bits" do
    path = 'spec/support/day_3/input.txt'
    readings = Input.new(path).to_bit_matrix

    expect(co2(readings)).to eq [0, 1, 0, 1, 0]
  end
end

RSpec.describe "#most_common_bit" do
  context "with uneven bits" do
    it "returns the most common bit in an array" do
      expect(most_common_bit([1, 1, 1, 1, 0])).to eq 1
    end
  end
  
  it "returns 1 with the same amount of 0s and 1s" do
    expect(most_common_bit([1, 1, 0, 0])).to eq 1
  end
end

RSpec.describe "#least_common_bit" do
  context "with uneven bits" do
    it "returns the least common bit in an array" do
      expect(least_common_bit([1, 1, 1, 1, 0])).to eq 0
    end
  end
  
  it "returns 0 with the same amount of 0s and 1s" do
    expect(least_common_bit([1, 1, 0, 0])).to eq 0
  end
end