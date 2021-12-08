class Digit
  def initialize(signal)
    @signal = signal
  end

  # defaults
  # 0: abcefg
  # 1: cf
  # 2: acdeg
  # 3: acdfg
  # 4: bcdf
  # 5: abdfg
  # 6: abdefg
  # 7: acf
  # 8: abcdefg
  # 9: abcdfg
    
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

  private

  attr_reader :signal
end