require 'minitest/autorun'
require_relative '../string_calculator.rb'

class TestStringCalculator < Minitest::Test

  describe "StringCalculator" do
  	
    it "should have an add method" do
      assert_equal ''.respond_to?(:_add), true
  	end

  end

end