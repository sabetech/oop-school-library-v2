require './book'
class BookCreator
    attr_reader :title, :author

    def initialize
        print 'Enter a book title'
        @title = gets.chomp

        print 'Enter a book author'
        @author = gets.chomp
    end

    def return_new_book
        Book.new(@title, @author)
    end

end