require 'pry'

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
      (1920..2002).include? data[:byr].to_i
    end

    def issue_year_in_range? 
      (2010..2020).include? data[:iyr].to_i
    end

    def expiry_year_in_range?
      (2020..2030).include? data[:eyr].to_i
    end
    
    def height_in_range?
      return false unless data[:hgt].end_with?('cm', 'in')

      if data[:hgt].end_with? 'cm'
        (150..193).include? data[:hgt].to_i
      else
        (59..76).include? data[:hgt].to_i
      end
    end
    
    def hair_color_in_range?
      data[:hcl].match? /#[0-9a-fA-F]{6}/
    end

    def eye_color_in_range? 
      colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
      colors.include? data[:ecl]
    end

    def pid_format?
      data[:pid].match? /^[0-9]{9}$/
    end
end