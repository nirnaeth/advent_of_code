class Display
  # the index of the array stands for the number displayed
  DEFAULT = [
    'abcefg',
    'cf',
    'acdeg',
    'acdfg',
    'bcdf',
    'abdfg',
    'abdefg',
    'acf',
    'abcdefg',
    'abcdfg'
  ]
      
  #   aaaa    ....    aaaa    aaaa    ....
  #  b    c  .    c  .    c  .    c  b    c
  #  b    c  .    c  .    c  .    c  b    c
  #   ....    ....    dddd    dddd    dddd
  #  e    f  .    f  e    .  .    f  .    f
  #  e    f  .    f  e    .  .    f  .    f
  #   gggg    ....    gggg    gggg    ....
  
  #   aaaa    aaaa    aaaa    aaaa    aaaa
  #  b    .  b    .  .    c  b    c  b    c
  #  b    .  b    .  .    c  b    c  b    c
  #   dddd    dddd    ....    dddd    dddd
  #  .    f  e    f  .    f  e    f  .    f
  #  .    f  e    f  .    f  e    f  .    f
  #   gggg    gggg    ....    gggg    gggg

  def initialize(signal)
    @signal = signal
  end

  def number
    case signal.size
    when 2
      1
    when 3
      7
    when 4
      4
    when 7
      8
    end
  end

  def wires
    signal.chars
  end

  def ordered_wires
    signal.chars.sort
  end

  # brings the display to its original wire configuration
  def match_wires
    case wires.size
    when 2
      {
        wires.first => DEFAULT[1].first,
        wires.last => DEFAULT[1].last
      }
    when 3
      decode_wires_for(7)
    when 4
      decode_wires_for(4)
    when 7
      decode_wires_for(8)
    end
  end

  private

  attr_reader :signal

  def decode_wires_for(number)
    {}.tap do |decoded|
      # binding.pry
      wires.each_with_index { |wire, index| decoded[wires[index]] = DEFAULT[number][index] }
    end
  end
end