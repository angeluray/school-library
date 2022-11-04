require 'date'

class Rental
  attr_accessor :date, :book, :customer

  def initialize(book, customer, date: Date.today)
    @date = date
    @customer = customer.name
    customer.rentals.push(self)
    book.rentals.push(self)
    @book = book.title
  end

  def rentals
    "#{@book}: #{@customer} #{@date}"
  end
end
