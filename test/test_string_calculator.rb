require 'minitest/autorun'
require_relative '../string_calculator.rb'

class TestStringCalculator < Minitest::Test

  describe "StringCalculator#_add" do
  	
    it "should have an _add method" do
      assert_equal ''.respond_to?(:_add), true
  	end

    it "should return sum as 0 if called on empty string" do
      assert_equal ''._add, 0 
    end

    it "should return sum of integers present in string separated by comma" do
      assert_equal '1'._add, 1
      assert_equal '1,2'._add, 3
      assert_equal '0,3,2,5'._add, 10
    end

  end

end