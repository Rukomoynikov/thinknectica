module Validation
  # def valid_length?(minimum, maximum, word)
  #   if word.length < minimum
  #     raise "Length of #{word} is too small"
  #   elsif word.length > maximum
  #     raise "Length of #{word} is too large"
  #   else
  #     true
  #   end
  # end

  # def valid_instance?(class_name, object)
  #   if class_name.to_s == object.class.to_s
  #     true
  #   else
  #     raise "Object is not instance of #{class_name}"
  #   end
  # end

  # def valid_format?(template, string)
  #   if template.class == String
  #     raise "Please formate string as in #{template}" if template != string
  #   elsif template.class == Regexp
  #     raise "Please formate string as in #{template}" if string !~ template
  #   else
  #     raise "The template #{template} not a string neither a regexp"
  #   end
  #   true
  # end

  def validate (attr_name, type)
    p type
  end

  def validate!
    p "validate!"
  end

  def valid?
    p "valid?"
  end

end
