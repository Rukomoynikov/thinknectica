module Speak
  def hi
    p "HI!"
  end
end

class Parent
  include Speak

  def initialize
    @name = "Родитель"
  end

 # protected
 #   attr_reader :name
 #   def private_from_parent
 #    p self.name
 #   end
end

class Child < Parent

  def initialize
    @name = "Потомок"
  end
  # def initialize
  #   self.private_from_parent
  # end
end

parent = Parent.new
child = Child.new

child.hi
p Child.ancestors