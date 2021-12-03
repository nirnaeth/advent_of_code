require "pry"

class Passport
  MANDATORY_FIELDS = [:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt]
  OPTIONAL_FIELDS = [:cid]

  def initialize(data)
    @data = data
  end

  def valid?
    # binding.pry
    fields_present? && 
    of_age? &&
    issue_year_in_range? &&
    expiry_year_in_range? &&
    height_in_range? &&
    hair_color_in_range? &&
    eye_color_in_range? &&
    pid_format?
  end

  private
    attr_reader :data

    def fields_present?
      (data.keys & MANDATORY_FIELDS).size == MANDATORY_FIELDS.size
    end

    def of_age? 
      false
    end

    def issue_year_in_range? 
      false
    end

    def expiry_year_in_range?
      false
    end
    
    def height_in_range?
      false
    end
    
    def hair_color_in_range?
      false
    end

    def eye_color_in_range? 
      false
    end

    def pid_format?
      false
    end
end