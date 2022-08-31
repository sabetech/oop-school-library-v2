class ListBooks
  attr_reader :books

  def initialize(books = [])
    @books = books
  end

  def push_book(book)
    @books << book
  end

  def print
    puts "\nList of Books: "
    if @books.length.zero?
      puts 'There is no book in the list. Please add a book!'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end
    end
    puts "\n"
  end

  def set_books(books)
    @books = books 
  end

  def to_json(*options)
    @books.to_json(*options)
  end
end
