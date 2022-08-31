require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe 'Rental Tests' do
  context 'Test Rental When ' do
    it 'should be able to create a rental' do
      person = Person.new(20, 'TestPerson')
      book = Book.new('TestBook', 'TestAuthor')
      rental = Rental.new('2008/01/01', person, book)
      expect(rental.date).to eq('2008/01/01')
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end
  end
end
