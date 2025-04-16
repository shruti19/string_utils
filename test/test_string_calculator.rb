require 'minitest/autorun'
require_relative '../string_calculator.rb'

class TestStringCalculator < Minitest::Test

  describe "StringCalculator#add" do
  	
    it "should have an add method" do
      assert_equal StringCalculator.respond_to?(:add), true
  	end

    it "should return sum as 0 if called on empty string" do
      assert_equal StringCalculator.add(''), 0 
    end

    it "should return sum of integers present in string separated by comma" do
      assert_equal StringCalculator.add('1'), 1
      assert_equal StringCalculator.add('1,2'), 3
      assert_equal StringCalculator.add('0,3,2,5'), 10
    end

    it "should accpet strings where numbers are separated by newline (\n) character" do
      assert_equal StringCalculator.add("1\n3"), StringCalculator.add('1,3')
      assert_equal StringCalculator.add("1\n3,4,2\n3"), 13
      assert_equal StringCalculator.add("1\n3,4,2\n,3"), 'Invalid Input'
    end

    it "should print 'Invalid Input' if comma and newline character are placed adjacent in a string" do
      assert_equal StringCalculator.add("1\n3,4,2\n,3"), 'Invalid Input'
    end

    it "should support a new delimiter introduced by string prefix '//[delimiter]\n'" do
      assert_equal StringCalculator.add("//;\n1;2"), 3 
      assert_equal StringCalculator.add("//|\n1|2|3"), 6 
      assert_equal StringCalculator.add("//|\n1|2|3,4\n1"), 11 
    end

  end

end