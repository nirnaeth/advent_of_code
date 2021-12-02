require "pry"

class Passport
  MANDATORY_FIELDS = [:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt]
  OPTIONAL_FIELDS = [:cid]

  def initialize(data)
    @data = data
  end

  def valid?
    # binding.pry
    (data.keys & MANDATORY_FIELDS).size == MANDATORY_FIELDS.size
  end

  private
    attr_reader :data
end