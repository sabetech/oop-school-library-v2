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

  def as_json(_options = {})
    {
      label: @label,
      students: @students
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
