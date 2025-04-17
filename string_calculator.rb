class StringCalculator
  SINGLECHAR_DELIM_REGEX = /^\/\/(.*)\n/
  MULTICHAR_DELIM_REGEX = /\[(.*?)\]/
  VALID_SINGLE_CHAR_DELIM_STRING = lambda {|new_delim| /\A( ?\d+ ?([\n,#{new_delim}] ?\d+)*)*\z/}
  VALID_MIXED_CHAR_DELIM_STRING = lambda {|singlechar_delim, multichar_delim|
                      /\A(\d+(?:[,\n#{singlechar_delim}]|([#{multichar_delim}])\2+)?)*\d*\z/ 
                  }

  def self.add str
    sum = 0
    return sum if str.empty?

    negitives = str.scan(/-\d+/).map(&:to_i)
    raise "negatives not allowed (found #{negitives.join(', ')})" if !negitives.empty?

    return "Invalid Input" if !valid?(str)
    nums = str.scan(/\d+/).select {|n| n.to_i < 1000}
    nums.each do |s|
      sum += s.to_i
    end

    sum
  end

   def self.valid? str
    delims = find_delimiters(str)
    if delims.is_a?Array
      singlechars = delims.select{|d| d.length == 1}.join('') 
      multichar = delims.select{|d| d.length > 1}
    else
      singlechars = delims
    end
    
    if multichar && !multichar.empty?   
      return !!(str =~ VALID_MIXED_CHAR_DELIM_STRING.call(singlechars, multichar))
    else
      return !!(str =~ VALID_SINGLE_CHAR_DELIM_STRING.call(singlechars))
    end
  end

  def self.find_delimiters str
    ## Check for multichar and/or multiple delimiters
    multichar_delims = str.scan(MULTICHAR_DELIM_REGEX).flatten
    if !multichar_delims.empty?
      prefix = "//[" + multichar_delims.join("][") + "]\n"
      ## Remove new delim prefix
      str.gsub!(prefix, '')
      return multichar_delims
    else
      ## Check for single char delimiter
      singlechar_delim = str.scan(SINGLECHAR_DELIM_REGEX).flatten[0].to_s
      ## Remove new delim prefix
      str.sub!(SINGLECHAR_DELIM_REGEX, '')
      return singlechar_delim
    end

  end

end
