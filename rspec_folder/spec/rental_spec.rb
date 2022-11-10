require_relative 'book_spec'
require_relative 'person_spec'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end

describe Rental do
  let(:person) { Person.new(12, 'Maddison') }
  let(:book) { Book.new('Harry', 'JK Rowling') }
  let(:rental) { Rental.new('10/12/2022', book, person) }

  it 'Should create a new instance' do
    expect(rental).to be_instance_of Rental
  end

  it 'Should create a Rental object' do
    expect(rental.person).to have_attributes(name: 'Maddison')
    expect(rental.book).to have_attributes(title: 'Harry')
    expect(rental.date).to eql '10/12/2022'
  end
end
