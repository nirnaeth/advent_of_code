require './day_8/signals'
require 'pry'

RSpec.describe '#read_input' do
  it 'separates signals and outputs' do
    path = 'spec/support/day_8/input.txt'
    values = read_input(path)

    expect(values).to eq expected
  end
end

RSpec.describe '#decode' do
  it 'decodes an input line' do
    input = {
      signals: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb', 'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'], 
      output: ['gbdfcae', 'bgc', 'cg', 'cgb']
    }

    expect(decode(input)).to eq 8717
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
