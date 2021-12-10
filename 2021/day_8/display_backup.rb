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

  def number(display)
    decoded_wires = decode_wires
    corrected = decoded_wires[display]
    DEFAULT.index(corrected)
  end

  def wires
    signal.chars
  end

  def ordered_wires
    signal.chars.sort
  end

  # brings the display to its original wire configuration
  # def decode_wires
  #   @decoded_wires ||= [].tap do |matched|
  #     DEFAULT.each do |default|
  #       {}.tap do |decoded|
  #         wires.each_with_index do |wire, index| 
  #           decoded[wire] = default[index] unless default[index].nil?
  #         end
  #         matched << decoded
  #       end
  #     end
  #   end
  # end

  def decode_wires
    @decoded_wires ||= {}.tap do |matched|
      DEFAULT.each do |default|
        {}.tap do |decoded|
          wires.each_with_index do |wire, index| 
            binding.pry
            decoded[wire] = default[index] unless default[index].nil?
          end
          matched[default] = decoded.keys.join
        end
      end
    end
  end


  private

  attr_reader :signal
  attr_accessor :decoded_wires
end