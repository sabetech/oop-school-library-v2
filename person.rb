require './nameable'
require './rental'
class Person < Nameable
  attr_accessor :rentals, :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    (of_age? || parent_permission?)
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def as_json(_options = {})
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def modify_id(id)
    @id = id
    self
  end

  private

  def of_age?
    @age > 18
  end
end
