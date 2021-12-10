require './day_8/display'
require 'pry'

RSpec.describe Display do
  describe '#number' do
    it 'returns 1 when the input is two characters' do
      display = Display.new('gcdbefa')

      expect(display.number('gc')).to eq 1
    end

    it 'returns 4 when the input is four characters' do
      display = Display.new('gcdbefa')

      expect(display.number('gcdb')).to eq 4
    end

    it 'returns 7 when the input is three digits' do
      display = Display.new('gcdbefa')

      expect(display.number('gcd')).to eq 7
    end

    it 'returns 8 when the input is seven digits' do
      display = Display.new('gcdbefa')

      expect(display.number('gcdbefa')).to eq 8
    end
  end

  describe '#wires' do
    it 'returns the wires that are lighiting the display' do
      display = Display.new('abc')

      expect(display.wires).to eq ['a', 'b', 'c']
    end
  end

  describe '#ordered_wires' do
    it 'returns the wires that are lighiting the display' do
      display = Display.new('abc')

      expect(display.ordered_wires).to eq ['a', 'b', 'c']
    end

    it 'sorts the wire in alphabetical order' do
      display = Display.new('bac')

      expect(display.ordered_wires).to eq ['a', 'b', 'c']
    end
  end

  # describe '#decode_wires' do
  #   it 'returns the wires for the display and their default value' do
  #     display = Display.new('gcdbefa')

  #     expect(display.decode_wires).to eq (
  #       [
  #         {"b"=>"e", "c"=>"b", "d"=>"c", "e"=>"f", "f"=>"g", "g"=>"a"},
  #         {"c"=>"f", "g"=>"c"},
  #         {"b"=>"e", "c"=>"c", "d"=>"d", "e"=>"g", "g"=>"a"},
  #         {"b"=>"f", "c"=>"c", "d"=>"d", "e"=>"g", "g"=>"a"},
  #         {"b"=>"f", "c"=>"c", "d"=>"d", "g"=>"b"},
  #         {"b"=>"f", "c"=>"b", "d"=>"d", "e"=>"g", "g"=>"a"},
  #         {"b"=>"e", "c"=>"b", "d"=>"d", "e"=>"f", "f"=>"g", "g"=>"a"},
  #         {"c"=>"c", "d"=>"f", "g"=>"a"},
  #         {"a"=>"g", "b"=>"d", "c"=>"b", "d"=>"c", "e"=>"e", "f"=>"f", "g"=>"a"},
  #         {"b"=>"d", "c"=>"b", "d"=>"c", "e"=>"f", "f"=>"g", "g"=>"a"}
  #       ]
  #     )
  #   end

  describe '#decode_wires' do
    it 'returns the wires for the display and their default value' do
      acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
      cdfeb fcadb cdfeb cdbaf

      ab -> 1 -> cf
      dab -> 7 -> acf
      eafb -> 4 -> bcdf
      acedgfb -> 8 -> cgbaedf

       dddd
      e    a
      e    a
       ffff
      g    b
      g    b
       cccc

        aaaa
       b    c
       b    c
        dddd
       e    f
       e    f
        gggg
      
      display = Display.new('acedgfb')

      expect(display.decode_wires).to eq (
        [
          {"b"=>"e", "c"=>"b", "d"=>"c", "e"=>"f", "f"=>"g", "g"=>"a"}, # 
          {"c"=>"f", "g"=>"c"}, # cg fc -> cf
          {"b"=>"e", "c"=>"c", "d"=>"d", "e"=>"g", "g"=>"a"},
          {"b"=>"f", "c"=>"c", "d"=>"d", "e"=>"g", "g"=>"a"},
          {"b"=>"f", "c"=>"c", "d"=>"d", "g"=>"b"},
          {"b"=>"f", "c"=>"b", "d"=>"d", "e"=>"g", "g"=>"a"},
          {"b"=>"e", "c"=>"b", "d"=>"d", "e"=>"f", "f"=>"g", "g"=>"a"},
          {"c"=>"c", "d"=>"f", "g"=>"a"}, 
          {"a"=>"c", "b"=>"f", "c"=>"g", "d"=>"a", "e"=>"b", "f"=>"d", "g"=>"e"}, # acedgfb cfgabde -> abcdefg
          {"b"=>"d", "c"=>"b", "d"=>"c", "e"=>"f", "f"=>"g", "g"=>"a"}
        ]
      )
    end
  end
end

# Within an entry, the same wire/segment connections are used (but you don't know what the connections actually are)
# The unique signal patterns correspond to the ten different ways the submarine tries to render a digit using the 
# current wire/segment connections. 
# signals: acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab 
# output: cdfeb fcadb cdfeb cdbaf
# Because 7 is the only digit that uses three segments, dab in the above example means that to render a 7, 
# signal lines d, a, and b are on. 
# Because 4 is the only digit that uses four segments, eafb means that to render a 4, signal lines e, a, f, and b are on.

def expected
  [
    {
      signals: ['be', 'cfbegad', 'cbdgef', 'fgaecd', 'cgeb', 'fdcge', 'agebfd', 'fecdb', 'fabcd', 'edb'], 
      output: ['fdgacbe', 'cefdb', 'cefbgd', 'gcbe']
    },
    {
      signals: ['edbfga', 'begcd', 'cbg', 'gc', 'gcadebf', 'fbgde', 'acbgfd', 'abcde', 'gfcbed', 'gfec'], 
      output: ['fcgedb', 'cgb', 'dgebacf', 'gc']
    },
    {
      signals: ['fgaebd', 'cg', 'bdaec', 'gdafb', 'agbcfd', 'gdcbef', 'bgcad', 'gfac', 'gcb', 'cdgabef'], 
      output: ['cg', 'cg', 'fdcagb', 'cbg']
    },
    {
      signals: ['fbegcd', 'cbd', 'adcefb', 'dageb', 'afcb', 'bc', 'aefdc', 'ecdab', 'fgdeca', 'fcdbega'], 
      output: ['efabcd', 'cedba', 'gadfec', 'cb']
    },
    {
      signals: ['aecbfdg', 'fbg', 'gf', 'bafeg', 'dbefa', 'fcge', 'gcbea', 'fcaegb', 'dgceab', 'fcbdga'], 
      output: ['gecf', 'egdcabf', 'bgf', 'bfgea']
    },
    {
      signals: ['fgeab', 'ca', 'afcebg', 'bdacfeg', 'cfaedg', 'gcfdb', 'baec', 'bfadeg', 'bafgc', 'acf'], 
      output: ['gebdcfa', 'ecba', 'ca', 'fadegcb']
    },
    {
      signals: ['dbcfg', 'fgd', 'bdegcaf', 'fgec', 'aegbdf', 'ecdfab', 'fbedc', 'dacgb', 'gdcebf', 'gf'], 
      output: ['cefg', 'dcbef', 'fcge', 'gbcadfe']
    },
    {
      signals: ['bdfegc', 'cbegaf', 'gecbf', 'dfcage', 'bdacg', 'ed', 'bedf', 'ced', 'adcbefg', 'gebcd'], 
      output: ['ed', 'bcgafe', 'cdgba', 'cbgef']
    },
    {
      signals: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb', 'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'], 
      output: ['gbdfcae', 'bgc', 'cg', 'cgb']
    },
    {
      signals: ['gcafb', 'gcf', 'dcaebfg', 'ecagb', 'gf', 'abcdeg', 'gaef', 'cafbge', 'fdbac', 'fegbdc'], 
      output: ['fgae', 'cfgab', 'fg', 'bagce']
    },
  ]
end
