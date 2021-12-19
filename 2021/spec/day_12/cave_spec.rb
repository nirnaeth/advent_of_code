require './day_12/cave'
require 'pry'

RSpec.describe 'Cave' do
  describe '#big?' do
    it 'returns true if the cave is big' do
      cave = Cave.new('A')

      expect(cave.big?).to be true
    end

    it 'returns false if the cave is small' do
      cave = Cave.new('a')

      expect(cave.big?).to be false
    end

    it 'returns false if the cave is the start' do
      cave = Cave.new('start')

      expect(cave.big?).to be false
    end

    it 'returns false if the cave is the end' do
      cave = Cave.new('end')

      expect(cave.big?).to be false
    end
  end

  describe '#small?' do
    it 'returns false if the cave is big' do
      cave = Cave.new('A')

      expect(cave.small?).to be false
    end

    it 'returns true if the cave is small' do
      cave = Cave.new('a')

      expect(cave.small?).to be true
    end

    it 'returns false if the cave is the start' do
      cave = Cave.new('start')

      expect(cave.small?).to be false
    end

    it 'returns false if the cave is the end' do
      cave = Cave.new('end')

      expect(cave.small?).to be false
    end
  end

  describe '#start?' do
    it 'returns false if the cave is big' do
      cave = Cave.new('A')

      expect(cave.start?).to be false
    end

    it 'returns false if the cave is small' do
      cave = Cave.new('a')

      expect(cave.start?).to be false
    end

    it 'returns true if the cave is the start' do
      cave = Cave.new('start')

      expect(cave.start?).to be true
    end

    it 'returns false if the cave is the end' do
      cave = Cave.new('end')

      expect(cave.start?).to be false
    end
  end

  describe '#end?' do
    it 'returns false if the cave is big' do
      cave = Cave.new('A')

      expect(cave.end?).to be false
    end

    it 'returns false if the cave is small' do
      cave = Cave.new('a')

      expect(cave.end?).to be false
    end

    it 'returns false if the cave is the start' do
      cave = Cave.new('start')

      expect(cave.end?).to be false
    end

    it 'returns true if the cave is the end' do
      cave = Cave.new('end')

      expect(cave.end?).to be true
    end
  end
end
