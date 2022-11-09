require_relative './decorator'

class Capitalize < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
