require './person'
class Student < Person
  alias as_json_parent as_json
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def as_json(_options = {})
    json = as_json_parent
    json['classroom'] = @classroom
    json['class_name'] = self.class.name
    json
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
