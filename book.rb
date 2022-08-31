class Book
  attr_accessor :title, :author
  attr_reader :rentals # this is supposed to be array that houses the rentals made by persons

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  def as_json(_options = {})
    {
      title: @title,
      author: @author
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
