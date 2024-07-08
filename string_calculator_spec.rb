require_relative "string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "handles new lines between numbers (instead of commas)" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports different delimiters specified on the first line" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception for negative numbers" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("Negatives not allowed: -2, -4")
    end

    it "ignores numbers larger than 1000" do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    it "supports delimiters of any length" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple delimiters" do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it "supports multiple delimiters of any length" do
      expect(StringCalculator.add("//[**][%%%]\n1**2%%%3")).to eq(6)
    end
  end
end
