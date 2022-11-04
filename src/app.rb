require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @list_people = []
    @list_books = []
    @rentals = []
  end

  def create_person
    puts 'Do you want to create a Student (1) or a Teacher (2) [Input the number]:'
    create_person_input = gets.chomp.to_i
    case create_person_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid please choose [1] or [2]'
      handler_create_person
    end
  end

  def handler_create_person
    create_p_input = gets.chomp.to_i
    case create_p_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Try again later'
      nil
    end
  end

  def create_student
    puts 'Age:'
    student_age = gets.chomp.to_i
    if student_age < 8 || student_age > 28 || student_age.nil?
      puts 'Invalid age, please insert an age between 8 and 28'
      student_age = gets.chomp.to_i
    end

    puts 'Name:'
    student_name = gets.chomp.capitalize
    label = 'Student'

    puts 'Do you have parent permission? [y/n]:'
    student_permission = gets.chomp
    if %w[n N].include?(student_permission)
      student_permission = false
    elsif %w[y Y].include?(student_permission)
      student_permission = true
    end

    student = Student.new(student_age, label, student_name, student_permission)
    @list_people.push(student)
    puts 'Person created successfully!'
  end

  def create_teacher
    puts 'Age:'
    teacher_age = gets.chomp.to_i
    if teacher_age < 28 || teacher_age > 60 || teacher_age.nil?
      puts 'Invalid age, please insert an age between 28 and 60'
      teacher_age = gets.chomp.to_i
    end

    puts 'Name:'
    teacher_name = gets.chomp.capitalize

    puts 'Specialization:'
    teacher_specialization = gets.chomp.capitalize

    teacher = Teacher.new(teacher_age, teacher_name, teacher_specialization)
    @list_people.push(teacher)
    puts 'Person created succesfully!'
  end

  def create_book
    puts 'Title:'
    book_title = gets.chomp.capitalize
    puts 'Author:'
    book_author = gets.chomp.capitalize
    book = Book.new(book_title, book_author)
    @list_books.push(book)
    puts 'Book created succesfully, well done!'
  end

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

  def push_rentals(rentals, rental)
    rentals.push(rental)
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    puts "\n"
    @list_books.each_with_index { |book, index| puts "(#{index}) => #{book.title} (#{book.author}) " }
    rental_book = gets.chomp.to_i
    puts "\n"

    puts 'Select a person from the following list by number [Not id]:'
    puts "\n"
    @list_people.each_with_index { |people, index| puts "(#{index}) => #{people.name}" }
    rental_person = gets.chomp.to_i

    push_rentals(@rentals, Rental.new(@list_books[rental_book], @list_people[rental_person]))
    puts 'Rental created succesfully, well done!'
    puts "\n"
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
