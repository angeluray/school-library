class Rental
  attr_accessor :date
  attr_reader :book, :customer

  def initialize(date, book, customer)
    @date = date

    @book = book
    @book.book_rentals.push(self)

    @customer = customer
    @customer.rentals.push(self)
  end
end
