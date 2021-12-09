require './day_8/display'
require 'pry'

RSpec.describe Display do
  describe '#number' do
    it 'returns 1 when the input is two characters' do
      display = Display.new('ab')

      expect(display.number).to eq 1
    end

    it 'returns 4 when the input is four characters' do
      display = Display.new('abcd')

      expect(display.number).to eq 4
    end

    it 'returns 7 when the input is three digits' do
      display = Display.new('abc')

      expect(display.number).to eq 7
    end

    it 'returns 8 when the input is seven digits' do
      display = Display.new('abcdefg')

      expect(display.number).to eq 8
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

  describe '#match_wires' do
    it 'returns the wires for the display and their default value' do
      display = Display.new('ecg')

      expect(display.match_wires).to eq ({
        'c' => 'c',
        'e' => 'a',
        'g' => 'f'
      })
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
