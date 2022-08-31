class BooksFile
  def initialize(books)
    @books = books
    @file_path = './data/books.json'
  end

  def write
    create_file(@file_path) unless File.exist?(@file_path)
    File.write(@file_path, JSON.pretty_generate(@books))
  end

  def read
    return unless File.exist?(@file_path)

    mybooks = []
    deserialized_books = JSON.parse(File.read(@file_path))
    deserialized_books.each do |book|
      mybooks << Book.new(book['title'], book['author'])
    end
    @books.books = mybooks
  end

  def create_file(full_path)
    dirname = File.dirname(full_path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(full_path, 'w')
  end
end
