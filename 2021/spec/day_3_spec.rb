require "./day_3/diagnostic"

# RSpec.describe "#sieve" do
# # oxygen generation rating
# # bit criteria: find the most common value in the current bit position (transposed matrix)
# # and keep only numbers with that bit in that position (original matrix). 
# # if 0 and 1 are equally common, keep the 1s
#   context "for oxygen" do
#     it "returns all the numbers starting with the same most common bit" do
#       readings = [
#         [0, 0, 1, 0, 0], 
#         [1, 1, 1, 1, 0], 
#         [1, 0, 1, 1, 0]
#       ]

#       expect(selector(:oxygen, readings)).to eq [
#         [1, 1, 1, 1, 0], 
#         [1, 0, 1, 1, 0]
#       ]
#     end

#     it "returns all the numbers starting with 1 if bits are equally common" do
#       readings = [
#         [0, 0, 1, 0, 0], 
#         [1, 1, 1, 1, 0], 
#         [1, 0, 1, 1, 0],
#         [0, 1, 0, 1, 0]
#       ]

#       expect(selector(:oxygen, readings)).to eq [
#         [1, 1, 1, 1, 0], 
#         [1, 0, 1, 1, 0]
#       ]
#     end
#   end
# end

RSpec.describe "#most_common_bit" do
  context "with uneven bits" do
    it "returns the most common bit in an array" do
      expect(most_common_bit(:break_to_one, [1, 1, 1, 1, 0])).to eq 1
    end
  end

  context "with the same amount of 0s and 1s" do
    it "returns 1 when given the :break_to_one flag" do
      expect(most_common_bit(:break_to_one, [1, 1, 0, 0])).to eq 1
    end

    it "returns 0 when given the :break_to_zero flag" do
      expect(most_common_bit(:break_to_zero, [1, 1, 0, 0])).to eq 0
    end
  end
end
