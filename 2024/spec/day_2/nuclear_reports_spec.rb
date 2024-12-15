require "pry"
require "./day_2/nuclear_reports.rb"

RSpec.describe "#is_safe?" do
  it "returns false if the report is not all increasing or all decreasing" do
    report = [1, 3, 2, 4, 5]

    expect(is_safe?(report)).to be false
  end

  it "returns false if the report is not all increasing or all decreasing" do
    report = [8, 6, 4, 4, 1]

    expect(is_safe?(report)).to be false
  end
end
