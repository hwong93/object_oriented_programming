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

# calling teach method on instructor and learn method on Student
chris.teach
cristina.learn

# The reason why calling teach method on a student class doesn't work and vice versa learn method on Instructor is because both those methods don't fall under each others class.
# They are both class methods. Now if both methods were written in the Parent Person Class, Cristina would be able to call teach and Chris would be able to call learn because they inherit those methods.
