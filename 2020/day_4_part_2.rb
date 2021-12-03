$LOAD_PATH << './lib'
require "input"
require "pry"
require "./day_4/passport"

path = "support/input_day_4.txt"
source = Input.new(path).to_str_array("\n\n")

[].tap do |passports|
  source.each do |item|
    entries = item.split(/\s/)
    
    {}.tap do |fields| 
      entries.each do |entry| 
        value = entry.split(":")
        fields[value.first.to_sym] = value.last
      end
      passport = Passport.new(fields) 
  
      passports << passport if passport.valid?
    end
  end

  p passports.count
end


# ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
# byr:1937 iyr:2017 cid:147 hgt:183cm

# iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
# hcl:#cfa07d byr:1929

# hcl:#ae17e1 iyr:2013
# eyr:2024
# ecl:brn pid:760753108 byr:1931
# hgt:179cm

# hcl:#cfa07d eyr:2025 pid:166559648
# iyr:2011 ecl:brn hgt:59in