module Gets
  def get_input(message)
    print "#{message}: "
    puts "\n"
    gets.chomp
  end

  def get_input_integer(message)
    print "#{message}: "
    puts "\n"
    gets.chomp.to_i
  end

  def put_label(message)
    puts message
    puts "\n"
  end
end
