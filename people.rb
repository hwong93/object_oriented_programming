class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end


  def greeting
    puts "Hi, my name is #{name}"
  end

end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

# Creating instance of instructor Chris and calling the greeting method from the parent class
chris = Instructor.new("Chris")
chris.greeting

# Creating instance of Student Cristina and call the greeting method from the parent class
cristina = Student.new("Cristina")
cristina.greeting
