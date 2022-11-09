require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './modules/list'
require_relative './modules/check'

class App
  def initialize
    @list_people = []
    @list_books = []
    @rentals = []
  end

  include ShowList
  include CheckConditions

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
      create_person
    end
  end

  def create_student
    puts 'Age:'
    student_age = gets.chomp.to_i
    age_stud_checker(student_age)
    student_age = gets.chomp.to_i

    puts 'Name:'
    student_name = gets.chomp.capitalize
    label = 'Student'

    puts 'Do you have parent permission? [y/n]:'
    student_permission = gets.chomp
    permission_checker(student_permission)

    student = Student.new(student_age, label, student_name, student_permission)
    @list_people.push(student)
    puts 'Person created successfully!'
  end

  def create_teacher
    puts 'Age:'
    teacher_age = gets.chomp.to_i
    age_checker(teacher_age)
    teacher_age = gets.chomp.to_i

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
end
