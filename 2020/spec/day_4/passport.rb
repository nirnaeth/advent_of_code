require "./day_4/passport"

RSpec.describe Passport do
  let(:fields) {
    {
      ecl: "gry", 
      pid: "860033327", 
      eyr: "2020", 
      hcl: "#fffffd", 
      iyr: "2017", 
      byr: "1937", 
      cid: "147", 
      hgt: "183cm"
    }
  }

  describe "#valid?" do
    it "returns true when all fields are present" do  
      passport = Passport.new(fields)

      expect(passport.valid?).to be true
    end

    it "returns true when the optional fields are missing" do
      fields.delete(:cid)
      passport = Passport.new(fields)

      expect(passport.valid?).to be true
    end

    it "returns false when one of the mandatory fields is missing" do
        fields.delete(:ecl)
        passport = Passport.new(fields)

      expect(passport.valid?).to be false
    end
  end
end