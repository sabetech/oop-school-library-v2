require './student'
require './teacher'
require './book'
require './rental'
require './book_creator'
require './person_creator'
require './list_books'
require './list_persons'
require './rental_creator'
require './persons_file'
require './books_file'
require './rentals_file'
require 'json'

class App
  def initialize

    @list_books = ListBooks.new
    @list_persons = ListPersons.new
    @rentals = []
    @persons_file = PersonsFile.new(@list_persons)
    @persons_file.read

    @books_file = BooksFile.new(@list_books)
    @books_file.read
    
    @rentals_file = RentalsFile.new(@rentals)
    @rentals_file.read
  end

  def run
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1. list all books'
      puts '2. list all people'
      puts '3. create a person (teacher or student)'
      puts '4. create a book'
      puts '5. create a rental'
      puts '6. list all rentals for a given person id'
      puts '7. Exit'
      option = gets.chomp.to_i
      process_input(option)
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def process_input(option)
    case option
    when 1
      @list_books.print
    when 2
      @list_persons.print
    when 3
      create_somebody
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      save
      puts 'Thank you for using School Library App'
      exit
    else
      puts 'please select another option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def create_book
    @list_books.push_book BookCreator.new.return_new_book
    puts 'The book is created successfuly'
  end

  def create_rental
    @rentals << RentalCreator.new(@list_books, @list_persons).return_new_rental
  end

  def list_rentals()
    if @rentals.length.zero?
      puts 'There is no rental in the list. Please add a rental!'
    else
      @list_persons.print
      puts "\nID of the Person: "
      id = gets.chomp.to_i
      puts "\nList of Rentals"
      @rentals.each do |rental|
        puts "Date: #{rental.date}. Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
      end
    end
    puts "\n"
  end

  def create_somebody()
    person = PersonCreator.new.person
    @list_persons.push_person(person) unless person.nil?
  end

  def save
    @persons_file.write
    @books_file.write
    @rentals_file.write
  end
end
