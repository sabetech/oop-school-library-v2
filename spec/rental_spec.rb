require 'json'
require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe 'Rental Tests' do
  before(:each) do
    @person = Person.new(20, 'TestPerson')
    @book = Book.new('TestBook', 'TestAuthor')
    @rental = Rental.new('2008/01/01', @person, @book)
  end

  context 'Test Rental When ' do
    it 'should be able to create a rental' do
      expect(@rental.date).to eq('2008/01/01')
      expect(@rental.person).to eq(@person)
      expect(@rental.book).to eq(@book)
    end

    it 'Should convert to json' do
      json = {
        date: @rental.date,
        person: @rental.person,
        book: @rental.book
      }

      expect(JSON.generate(@rental)).to eq(JSON.generate(json))
    end
  end
end
