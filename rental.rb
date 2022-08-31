class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end

  def as_json(_options = {})
    {
      date: @date,
      person: @person,
      book: @book
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
