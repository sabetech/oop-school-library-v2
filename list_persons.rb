class ListPersons
  attr_reader :persons

  def initialize(persons = [])
    @persons = persons
  end

  def push_person(person)
    @persons << person
  end

  def print
    puts "\nList of Persons: "
    if @persons.length.zero?
      puts 'There is no one in the list. Please add a person!'
    else
      @persons.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "[Student] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        else
          puts "[Teacher] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        end
      end
    end
    puts "\n"
  end

  def to_json(*options)
    @persons.to_json(*options)
  end
end
