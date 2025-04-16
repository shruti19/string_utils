class StringCalculator

	def self.add str
		return 0 if str.empty?

		sum = 0 
		nums = str.scan(/\d+/)
		nums.each do |s|
			sum += s.to_i
		end

		sum		
	end

end