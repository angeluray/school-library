module ShowList
  def list_book
    puts "\n"
    puts 'LISTED BOOKS|||||||||||||||||||||||||||||||'
    @list_books.each.with_index(1) do |book, index|
      puts "#{index}) Title:'#{book.title}', Author: #{book.author}"
    end
  end

  def list_people
    if @list_people.empty?
      puts 'No person registered yet!'
    else
      @list_people.each.with_index do |person, index|
        puts "(ID: #{index}-#{person.id}) [#{person.class}] NAME: #{person.name} AGE: #{person.age}"
      end
    end
  end

  def rentals_user(rentals, id)
    if rentals.empty?
      puts "No rental registed for #{id}!"
    else
      puts "\n"
      puts 'Registered Rentals: '
      rentals.each do |rental|
        next if rental.customer != id

        puts "DATE: #{rental.date}"
        puts rental.rentals
      end
    end
  end

  def list_rentals
    if @list_people.empty? || @rentals.empty?
      puts 'NO RENTALS DATA'
    else
      puts "\n"
      puts 'Please enter a person by first number of ID:'
      @list_people.select.with_index { |person, index| puts "ID: #{index}-#{person.id} => #{person.name}" }
      person_id = gets.chomp.to_i
      rentals_user(@rentals, @list_people[person_id].name)
      puts "\n"
    end
  end
end
