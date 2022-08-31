class PersonsFile
  def initialize(persons)
    @persons = persons
    @file_path = 'data/persons.json'
  end

  def write
    File.write(@file_path, JSON.pretty_generate(@persons))
  end
end
