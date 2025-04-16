class StringCalculator
  NEW_DELIM_PREFIX_REGEX = /^\/\/(.)\n/
  VALID_STRING_REGEX = lambda {|new_delim| /\A( ?\d+ ?([\n,#{new_delim}] ?\d+)*)*\z/}

  def self.add str
    sum = 0
    return sum if str.empty?

    negitives = str.scan(/-\d+/).map(&:to_i)
    raise "negatives not allowed (found #{negitives.join(', ')})" if !negitives.empty?

    return "Invalid Input" if !valid?(str)
    nums = str.scan(/\d+/)
    nums.each do |s|
      sum += s.to_i
    end

    sum
  end

  def self.valid? str
    new_delim = [str].grep(NEW_DELIM_PREFIX_REGEX){$1}[0]
    
    if new_delim
      str.sub!(NEW_DELIM_PREFIX_REGEX, '')
    end

    return !!(str =~ VALID_STRING_REGEX.call(new_delim))
  end

end