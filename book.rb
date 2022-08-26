class Book
  attr_accessor :title, :author
  attr_reader :rentals # this is supposed to be array that houses the rentals made by persons

  def initialize(title, author)
    @title = title
    @author = author
    # rentals = []
  end

  def add_rentals=(rental)
    rental.book = self
    rentals.push(rental)
  end
end
