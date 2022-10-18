# Classes related to Animal entity
class Animal
  def make_sound(visitor)
    raise NotImplementedError, "#{self.class} #make_sound method must be implemented"
  end
end

class Dog < Animal
  def make_sound(visitor)
    visitor.bark
  end
end

class Cat < Animal
  def make_sound(visitor)
    visitor.meow
  end
end

# Classes related to Visitor entity
class Visitor
  def bark
    raise NotImplementedError, "#{self.class} #bark method must be implemented"
  end

  def meow
    raise NotImplementedError, "#{self.class} #meow method must be implemented"
  end
end

class ConcreteVisitor < Visitor
  def bark
    puts "Bark"
  end

  def meow
    puts "Meow"
  end
end

# Run program
Dog.new.make_sound(ConcreteVisitor.new)
Cat.new.make_sound(ConcreteVisitor.new)