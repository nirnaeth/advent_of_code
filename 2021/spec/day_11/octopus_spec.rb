require './day_11/octopus'
require 'pry'

RSpec.describe '#setup' do
  it 'organizes octopi by energy level' do
    octopi = {
      '0:0' => 3,
      '0:1' => 4,
      '0:2' => 3,
      '0:3' => 1,
      '0:4' => 2
    }
    
    ledger = setup(octopi)

    expect(ledger).to eq ([
      [], 
      [{"0:3"=>1}], 
      [{"0:4"=>2}], 
      [{"0:0"=>3, "0:2"=>3}], 
      [{"0:1"=>4}], 
      [], 
      [], 
      [], 
      [], 
      []
    ])
  end
end
# RSpec.describe '#neighbours' do
#   it 'finds the neighbours of the specified octopus' do
#     # [2,  1 ,  9 ,  9 , 9, 4, 3, 2, 1, 0], 
#     # [3,  9 ,  8 ,  7 , 8, 9, 4, 9, 2, 1], 
#     # [9, _8_, _5_, _6_, 7, 8, 9, 8, 9, 2], 
#     # [8, _7_, x6x, _7_, 8, 9, 6, 7, 8, 9], 
#     # [9, _8_, _9_, _9_ , 9, 6, 5, 6, 7, 8]
#     coordinates = Coordinate.new(2, 3) # x, y
    
#     expect(neighbours(coordinates, map)).to eq (
#       {
#         "2:2" => 5, 
#         "2:1" => 8, 
#         "3:1" => 7,
#         "4:1" => 8, 
#         "4:2" => 9, 
#         "4:3" => 9,
#         "3:3" => 7,
#         "2:3" => 6,
#       }
#     )
#   end
# end