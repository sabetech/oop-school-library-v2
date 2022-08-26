class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # add students to this classroom and set the new student's classroom to this classroom
  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
