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

  end

end