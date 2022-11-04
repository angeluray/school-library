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
    if student_age < 8 || student_age > 21
      puts 'Invalid age, please insert an age between 8 and 21'
      student_age = gets.chomp.to_i
    end

    puts 'Name:'
    student_name = gets.chomp.capitalize
    label = 'Student'

    puts 'Do you have parent permission? [y/n]:'
    student_permission = gets.chomp
    if %w[n N].include?(student_permission)
      false
    elsif %w[y Y].include?(student_permission)
      true
    end

    student = Student.new(student_age, label, student_name, student_permission)
    @list_people.push(student)
    puts 'Person created successfully!'
  end

  def create_teacher
    puts 'Age:'
    teacher_age = gets.chomp.to_i
    if teacher_age < 21 || teacher_age > 60
      puts 'Invalid age, please insert an age between 22 and 60'
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
    puts 'Author'
    book_author = gets.chomp.capitalize
    book = Book.new(book_title, book_author)
    @list_books.push(book)
    puts 'Book created succesfully, well done!'
  end

  def list_book
    @list_books.each.with_index(1) do |book, index|
      puts "#{index}) Title:'#{book.title}', Author: #{book.author}"
    end
  end

  def list_people
    @list_people.each.with_index(1) do |person, index|
      puts "#{index}). [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def push_rentals(rentals, rental)
    rentals.push(rental)
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_book

    rental_book = gets.chomp.to_i

    puts 'Select a person from the following list by number [Not id]:'

    list_people

    rental_person = gets.chomp.to_i

    # puts 'Date:'
    # date = gets.chomp

    push_rentals(@rentals, Rental.new(@list_books[rental_book], @list_people[rental_person]))
    puts 'Rental created succesfully, well done!'
  end

  def list_rentals
    list_people
    puts 'Please enter a person ID:'
    person_id = gets.chomp.to_i

    rental_perso = nil

    @list_people.each do |item|
      rental_perso = item if item.id == person_id
    end

    puts 'According to the user you selected, these are the rentals:'

    rental_perso.rentals.each do |rental|
      puts "Date #{rental.date}, Book '#{rental.book.title}', by #{rental.book.author}"
    end
  end
end
