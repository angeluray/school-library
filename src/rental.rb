class Rental
  attr_accessor :date
  attr_reader :book, :customer

  def initialize(book, customer, date)
    @date = date
    @customer = customer
    book.rentals.push(self)
    customer.rentals.push(self)
  end

  def rentals
    "#{@book.title}: #{@customer.name} #{@date}"
  end
end
