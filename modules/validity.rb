module Validity
  def if_name(name)
    return unless name == ''

    put_label('Invalid name')
  end

  def if_age(age)
    return unless age < 18 || age > 65 || age.nil?

    put_label('Sorry, a teacher must have a valid age')
  end

  def if_specialization(specialization)
    return unless specialization == ''

    put_label('Invalid specialization')
  end

  def case_parent_permission(parent_permission)
    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    else
      put_label('Invalid entry')
    end
  end
end
