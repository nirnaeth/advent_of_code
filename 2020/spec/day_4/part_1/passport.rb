require "./day_4/part_1/passport"

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
    context "with a valid passport" do
      it "returns true" do  
        passport = Passport.new(fields)

        expect(passport.valid?).to be true
      end

      it "returns true when the optional fields are missing" do
        fields.delete(:cid)
        passport = Passport.new(fields)

        expect(passport.valid?).to be true
      end
    end

    it "returns false when one of the mandatory fields is missing" do
        fields.delete(:ecl)
        passport = Passport.new(fields)

      expect(passport.valid?).to be false
    end

    context "birth year" do
      xit "returns false when the person is too old" do
      end

      xit "returns false when the person is too young" do
      end
    end

    context "issue year" do
      xit "returns false when the passport was issued too long ago" do
      end

      xit "returns false when the passport is issued with a future date" do
      end
    end

    context "expiration year" do
      xit "returns false when the passport expired" do
      end

      xit "returns false when the passport expire more than 10 years in the future from now" do
      end
    end

    context "height" do
      xit "returns false when it is not a number" do
      end

      xit "returns false when it is not in the allowed range for the metric system" do
      end

      xit "returns false when it is not in the allowed range for the imperial system" do
      end
    end

    context "hair color" do
      xit "returns false when it is not in the range" do
      end

      xit "returns false when it is not in the hex format" do
      end
    end

    context "eye color" do
      xit "returns false when it is not in the range" do
      end
    end

    context "passport id" do
      xit "returns false when it is not in the defined format" do
      end
    end
  end
end