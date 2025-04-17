require 'minitest/autorun'
require_relative '../string_calculator.rb'

class TestStringCalculator < Minitest::Test

  describe "StringCalculator#add" do
  	
    it "should have an add method" do
      assert_respond_to StringCalculator, :add
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

    it "should throw execption if string has negative numbers and list all negative numbers" do
      err = assert_raises RuntimeError do 
        StringCalculator.add("-1,0,-5,4")
      end
      assert_equal err.message, "negatives not allowed (found -1, -5)"
    end

    it "should skip adding number > 1000" do
      assert_equal StringCalculator.add("1,1000\n200\n5"), 206 
    end

    it "should support delimiters having more than one character introduced by string prefix '//[delimiter]\n'" do
      assert_equal StringCalculator.add("//[%%%]\n1%%%3%%%8"), 12
      assert_equal StringCalculator.add("//[**]\n1**3**8"), 12
      assert_equal StringCalculator.add("//[$][||]\n1$3||8"), 12
    end

  end

  describe "StringCalculator#find_delimiters" do
    it "should have an find_delimiters method" do
      assert_respond_to StringCalculator, :find_delimiters
    end

    it "should return an Array if string has introduced multichar or multiple delimiters" do
      assert StringCalculator.find_delimiters("//[***]\n1***2").is_a?(Array), true
    end

    it "should return a String if string has no new delimiter or introduced a singlechar delimiter" do
      assert StringCalculator.find_delimiters("1,2").is_a?(String), true
      assert StringCalculator.find_delimiters("//;\n1;2").is_a?(String), true
    end

    it "should return list of all delimiters in order they are specified" do
      assert_equal StringCalculator.find_delimiters("//[**][$][%]\n1,2**3"), ['**', '$', '%']
    end

    it "should remove the first line of delimiter declaration from string after all delimiters are captured" do
      str1 = "//[****][$]\n1****2,3"
      str2 = "//:\n1:2,3"
      StringCalculator.find_delimiters(str1)
      StringCalculator.find_delimiters(str2)
      assert_equal str1, "1****2,3"
      assert_equal str2, "1:2,3"
    end
  end

end