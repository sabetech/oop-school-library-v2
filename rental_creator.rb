require './rental'

class RentalCreator
  def initialize(list_books, list_persons)
    @list_books = list_books
    @list_persons = list_persons

    print "\nSelect a book from the following list by number: "
    list_books.print
    @book_index = gets.chomp.to_i

    print "\nSelect a person from the following list by number (not id): "
    list_persons.print
    @person_index = gets.chomp.to_i

    print 'Enter a date [format yyyy/mm/dd]: '
    @date = gets.chomp
  end

  def return_new_rental
    rental = Rental.new(@date, @list_persons.persons[@person_index - 1], @list_books.books[@book_index - 1])

    puts "Rental created successfully\n\n"

    rental
  end
end
