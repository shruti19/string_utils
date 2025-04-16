class String

	## method name begins with _ to avoid chances of name conflicts with existing method
	def _add
		return 0 if self.empty?

		sum = 0 
		nums = self.scan(/\d+/)
		nums.each do |s|
			sum += s.to_i
		end

		sum		
	end

end