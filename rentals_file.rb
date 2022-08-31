class RentalsFile
  def initialize(rentals)
    @rentals = rentals
    @file_path = './data/rentals.json'
  end

  def write
    self.create_file(@file_path) unless File.exist?(@file_path)
    File.write(@file_path, JSON.pretty_generate(@rentals))
  end

  def read
    if File.exist?(@file_path)
      myrentals = []
      deserialized_rentals = JSON.parse(File.read(@file_path))
      deserialized_rentals.each do |rental|
        case rental['person']['class_name']
        when 'Student'
          person = Student.new(rental['person']['age'], rental['person']['classroom'], rental['person']['name'], parent_permission: rental['person']['parent_permission']).modify_id(rental['person']['id'])
        when 'Teacher'
          person = Teacher.new(rental['person']['age'], rental['person']['specialization'], name: rental['person']['name']).modify_id(rental['person']['id'])
        end

        @rentals << Rental.new(rental['date'], person, Book.new(rental['book']['title'], rental['book']['author']))

      end
      
    end
  end

  def create_file(full_path)
    dirname = File.dirname(full_path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(full_path, 'w')
  end

end
