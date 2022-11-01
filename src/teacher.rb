require './add'

class Teacher < Person
  def initialization(age, specialization, name = "Unknown", parent_permission = true)
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
