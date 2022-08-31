require './student'
require './teacher'
require 'fileutils'

class PersonsFile
  def initialize(persons)
    @persons = persons
    @file_path = './data/persons.json'
  end

  def write
    create_file(@file_path) unless File.exist?(@file_path)
    File.write(@file_path, JSON.pretty_generate(@persons))
  end

  def read
    return unless File.exist?(@file_path)

    mypersons = []
    serialized_persons = JSON.parse(File.read(@file_path))
    serialized_persons.each do |person|
      mypersons << case person['class_name']
                   when 'Student'
                     Student.new(person['age'], person['classroom'], person['name'],
                                 parent_permission: person['parent_permission']).modify_id(person['id'])
                   when 'Teacher'
                     Teacher.new(person['age'], person['specialization'],
                                 name: person['name']).modify_id(person['id'])
                   end
      @persons.persons = mypersons
    end
  end

  def create_file(full_path)
    dirname = File.dirname(full_path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(full_path, 'w')
  end
end
