require 'json'
require_relative '../person'
require_relative '../book'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe 'Person' do
  before(:each) do
    @person = Person.new(22, 'TestPerson', parent_permission: false)
  end

  it 'Should take the age, the name, and the parent_permission' do
    expect(@person.age).to eq(22)
    expect(@person.name).to eq('TestPerson')
    expect(@person.parent_permission).to eq(false)
  end

  it 'Should take the age and set default values' do
    new_person = Person.new(28)
    expect(new_person.age).to eq(28)
    expect(new_person.name).to eq('Unknown')
    expect(new_person.parent_permission).to eq(true)
  end

  it 'Should return true if the age is greater than or equal to 18' do
    new_person = Person.new(22, 'TestPerson', parent_permission: false)
    expect(new_person.can_use_services?).to eq(true)
  end

  it 'Should instead return false if age is less than or equal to 18' do
    new_person = Person.new(15, 'TestPerson', parent_permission: false)
    expect(new_person.can_use_services?).to eq(false)
  end

  it 'Should return the corrected name when using CapitalizeDecorator and TrimmerDecorator' do
    new_person = Person.new(29, 'TestPersontestperson', parent_permission: true)
    capitalized_person = CapitalizeDecorator.new(new_person)
    capitalized_person.correct_name
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    expect(capitalized_trimmed_person.correct_name).to eq('Testperson')
  end

  it 'Should add a rental when add_rental method is called' do
    @person.rentals = []
    new_book = Book.new('test title', 'test author')
    @person.add_rental(new_book, '2022.09.09')

    expect(@person.rentals.size).to eq(1)
  end

  it 'Should convert to json' do
    json = {
      id: @person.id,
      name: @person.name,
      age: @person.age,
      parent_permission: @person.parent_permission
    }

    expect(JSON.generate(@person)).to eq(JSON.generate(json))
  end
end
