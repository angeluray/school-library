class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? == true || @parent_permission == true
  end

  private

  def of_age?
    if @age >= 18
      true
    elsif @age < 18
      false
    end
  end
end
