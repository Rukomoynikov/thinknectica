module Validator

  def valid_length?(minimum, maximum, word)
    if word.length < minimum 
      raise "Length of #{word} is too large"
    elsif word.length > maximum
      raise "Length of #{word} is too small"
    else 
      return true
    end
  end

  def valid_instance?(class_name, object)
    if class_name == object.class
      return true
    else 
      raise "Object is not instance of #{class_name}"
    end
  end

  def valid_format?(template, string)
    if template.class == String
      raise "Please formate string as in #{template}" if template != string
    elsif template.class == Regexp
      raise "Please formate string as in #{template}" if string !~ template
    else
      raise "The template #{template} not a string neither a regexp"
    end
    return true
  end

end