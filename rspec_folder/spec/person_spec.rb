require_relative '../files_needed'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission, :id

  def initialize(age, name = 'unknown', parent_permission = true)
    super()
    @id = 25
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @correct_name = name
  end
end

describe Person do
  context 'When testing Person class' do
    it 'Should create a person when I pass arguments to the instance' do
      person = Person.new(15, 'Angel Uray', false)
      expect(person).to be_instance_of Person
      expect(person).to have_attributes(name: 'Angel Uray')
      expect(person).to have_attributes(age: 15)
      expect(person).to have_attributes(parent_permission: false)
      expect(person).to have_attributes(id: 25)
      expect(person.rentals).to match_array([])
    end
  end
end
