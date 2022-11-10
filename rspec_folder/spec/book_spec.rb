class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

describe Book do
  context 'When testing the Book class' do
    it 'should creates a new book when we instantiate it' do
      book = Book.new('Harry', 'JK Rowling')
      expect(book).to be_instance_of Book
      expect(book).to have_attributes(title: 'Harry')
      expect(book).to have_attributes(author: 'JK Rowling')
      expect(book.rentals).to match_array([])
    end
  end
end
