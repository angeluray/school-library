require './add'

class Teacher < Person
  def initialization(specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
