require './day_8/display'
require 'pry'

RSpec.describe '#read_input' do
  it 'separates signals and outputs' do
    path = 'spec/support/day_8/input.txt'
    values = read_input(path)

    expect(values).to eq expected
  end
end

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
