require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'My Test Title', 'My Test Author'
  end

  describe '#new' do
    it 'takes three parameters and return a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  it 'Should take the title and author' do
    expect(@book.title).to eq('My Test Title')

    expect(@book.author).to eq('My Test Author')
  end

  it 'Should convert to json' do
    json = {
      title: @book.title,
      author: @book.author
    }

    expect(JSON.generate @book).to eq(JSON.generate json)
  end
end
