class BooksFile
  def initialize(books)
    @books = books
    @file_path = 'data/books.json'
  end

  def write
    File.write(@file_path, JSON.pretty_generate(@books))
  end
end
