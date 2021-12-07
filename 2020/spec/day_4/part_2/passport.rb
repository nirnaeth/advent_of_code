require './day_4/part_2/passport'

RSpec.describe Passport do
  let(:fields) {
    {
      ecl: 'gry', 
      pid: '860033327', 
      eyr: '2020', 
      hcl: '#fffffd', 
      iyr: '2017', 
      byr: '1937', 
      cid: '147', 
      hgt: '183cm'
    }
  }

  describe '#valid?' do
    context 'with a valid passport' do
      it 'returns true' do  
        passport = Passport.new(fields)

        expect(passport.valid?).to be true
      end

      it 'returns true when the optional fields are missing' do
        fields.delete(:cid)
        passport = Passport.new(fields)

        expect(passport.valid?).to be true
      end

      context 'passport id' do
        it 'returns true when it has leading zeroes' do
          fields[:pid] = '000000000'
          passport = Passport.new(fields)

          expect(passport.valid?).to be true
        end
      end
    end

    context 'with an invalid passport' do
      it 'returns false when one of the mandatory fields is missing' do
        fields.delete(:ecl)
        passport = Passport.new(fields)

        expect(passport.valid?).to be false
      end

      context 'birth year' do
        it 'returns false when the person is too old' do
          fields[:byr] = '1919'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it "returns false when the person is too young" do
          fields[:byr] = '2003'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'issue year' do
        it 'returns false when the passport was issued too long ago' do
          fields[:iyr] = '2009'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when the passport is issued with a future date' do
          fields[:iyr] = '2021'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'expiration year' do
        it 'returns false when the passport expired' do
          fields[:eyr] = '2019'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when the passport expire more than 10 years in the future from now' do
          fields[:iyr] = '2031'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'height' do
        it 'returns false when the measurement system is not valid' do
          fields[:hgt] = 'xs'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is too short for the metric system' do
          fields[:hgt] = '149cm'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is too tall for the metric system' do
          fields[:hgt] = '194cm'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is too short for the imperial system' do
          fields[:hgt] = '58in'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is too tall for the imperial system' do
          fields[:hgt] = '77in'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'hair color' do
        it 'returns false when it is not in the range' do
          fields[:hcl] = '#GGA2F1'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is not in the hex format' do
          fields[:hcl] = '77test'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'eye color' do
        it 'returns false when it is not in the range' do
          fields[:ecl] = '77test'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end

      context 'passport id' do
        it 'returns false when it is shorter than 9 digits' do
          fields[:pid] = '77'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is longer than 9 digits' do
          fields[:pid] = '7777777777'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end

        it 'returns false when it is not made of only numbers' do
          fields[:pid] = 'aaaaaaaaa'
          passport = Passport.new(fields)

          expect(passport.valid?).to be false
        end
      end
    end
  end
end