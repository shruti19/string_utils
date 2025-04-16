class StringCalculator

	def self.add str
		return 0 if str.empty?

		sum = 0 
		is_valid = validate(str)
		return "Invalid Input" if !is_valid
		nums = str.scan(/\d+/)
		nums.each do |s|
			sum += s.to_i
		end

		sum		
	end


	def self.validate str
		regex = /\A( ?\d+ ?([\n,] ?\d+)*)*\z/
		return !!(str =~ regex)
	end

end