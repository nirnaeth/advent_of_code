class Cave
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def start?
    value == 'start'
  end

  def small?
    !['start', 'end'].include?(value) && !self.big?
  end

  def big?
    value == value.upcase
  end

  def end?
    value == 'end'
  end
end