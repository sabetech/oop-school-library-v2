require './student'
require './teacher'
class PersonCreator
  attr_reader :person

  def initialize
    print 'What kind of person do you want to create? [1] Student or [2] for Teacher: '
    person_type = gets.chomp.to_i

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    case person_type
    when 1
      @person = new_student(age, name)
    when 2
      @person = new_teacher(age, name)
    else
      puts 'Invalid Input: Enter a valid option'
    end
  end

  def new_student(age, name)
    print 'Parent permission [y/n]: '
    parent_permission = gets.chomp

    print 'Classroom: '
    classroom = gets.chomp

    case parent_permission
    when 'y'
      Student.new(age, classroom, name, parent_permission: true)
    when 'n'
      Student.new(age, name, parent_permission: false)
    else
      puts 'Invalid Input: Enter a valid option'
    end
  end

  def new_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name: name)
  end
end
