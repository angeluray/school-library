require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, _parent_permission)
    super(age, name, parent_permission: true)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
