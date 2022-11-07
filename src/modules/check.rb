module CheckConditions
  def age_checker(user_param)
    puts 'Invalid age, please insert an age between 28 and 60' if user_param < 28 || user_param > 60 || user_param.nil?
  end

  def age_stud_checker(student_param)
    return unless student_param < 8 || student_param > 28 || student_param.nil?

    puts 'Invalid age, please insert an age between 8 and 28'
  end

  def permission_checker(permission_param)
    if %w[n N].include?(permission_param)
      permission_param = false
    elsif %w[y Y].include?(permission_param)
      permission_param = true
    end
  end
end
