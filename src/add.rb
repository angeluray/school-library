require_relative './nameable'
require_relative './capitalize'
require_relative './trim'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @correctable_name = name
  end

  def add_rentals(date, book_info)
    Rental.new(date, book_info, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

p person = Person.new(22, 'maximilianus')
p person.correct_name
p capitalized_person = Capitalize.new(person)
p capitalized_person.correct_name
p capitalized_trimmed = Trimmer.new(capitalized_person)
p capitalized_trimmed.correct_name
