class RentalsFile
  def initialize(rentals)
    @rentals = rentals
    @file_path = 'data/rentals.json'
  end

  def write
    File.write(@file_path, JSON.pretty_generate(@rentals))
  end
end
