require_relative '../teacher'

describe 'Teacher' do
  before(:each) do
    @teacher = Teacher.new(32, 'Math', name: 'Steve')
  end

  it 'Should take the age, the specialization, and the name' do
    expect(@teacher.age).to eq(32)
    expect(@teacher.specialization).to eq('Math')
    expect(@teacher.name).to eq('Steve')
  end

  it 'Should take the age' do
    new_teacher = Teacher.new(36, 'English')
    expect(new_teacher.age).to eq(36)
    expect(new_teacher.specialization).to eq('English')
    expect(new_teacher.name).to eq('Unknown')
  end

  it 'Should return true if the age is greater than or equal to 18' do
    new_teacher = Teacher.new(45, 'Programming', name: 'John Doe')
    expect(new_teacher.can_use_services?).to eq(true)
  end

  it 'Should convert to json' do
    expect(JSON.parse(JSON.generate(@teacher))['specialization']).to eq(@teacher.specialization)
  end
end
