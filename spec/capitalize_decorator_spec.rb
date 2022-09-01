require_relative '../person'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing decorator classes' do
    it 'Should return a capitalized string' do
      person = Person.new(22, 'testperson')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq 'Testperson'
    end
  end
end
