require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission, :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    if @age >= 18
      true
    elsif @age < 18
      false
    end
  end

  public

  def can_use_services?
    return unless @age >= 18 || @parent_permission == true
  end

  def correct_name
    @correct_name = name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
