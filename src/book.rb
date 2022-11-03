class Book
  attr_accessor :title, :author, :book_rentals

  def initialize(title, author)
    @title = title
    @author = author
    @book_rentals = []
  end

  def add_customer_rentals(date, customer)
    Rental.new(date, self, customer)
  end
end
