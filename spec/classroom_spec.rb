require 'spec_helper'

describe 'ClassRoom' do
  context 'Classroom Test When ' do
    it 'should be able to create a classroom' do
      classroom = Classroom.new('TestClassroomA')
      expect(classroom.label).to eq('TestClassroomA')
      expect(classroom.students).to eq([])
    end

    it 'should be able to add a student to a classroom' do
      classroom = Classroom.new('TestClassroomB')
      student = Student.new(22, 'TestStudent')
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it 'should be able to add multiple students to a classroom' do
      classroom = Classroom.new('TestClassroomC')
      student1 = Student.new(20, 'student1')
      student2 = Student.new(22, 'student2')
      classroom.add_student(student1)
      classroom.add_student(student2)
      expect(classroom.students).to eq([student1, student2])
    end
  end
end
