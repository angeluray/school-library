require_relative './nameable'
require_relative './capitalize'
require_relative './trim'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @correctable_name = name
  end

  private

  def of_age?
    @age >= 18
  end
end
