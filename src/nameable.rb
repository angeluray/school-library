require_relative './add'

class Nameable < Person
  def correct_name
    raise NotImplementedError, 'Correctable'
  end
end
