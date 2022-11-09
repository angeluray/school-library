require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'modules/list'
require_relative 'modules/gets_puts'
require_relative 'modules/validity'
require_relative 'JSONdata/handle_json'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    read_books
    read_people
    read_rentals
  end

  include List
  include Gets
  include Validity
  include FileHandler

  # CREATE PERSON
  def create_person
    input = get_input('Do you want to create a student (1) or teacher (2)? [Input the number]')
    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      put_label('Invalid entry')
    end
    store_people
  end

  # CREATE STUDENT
  def create_student
    age = get_input_integer('Student\'s Age')
    if_age(age)

    name = get_input('Student\'s Name')
    if_name(name)

    puts 'Does student have parent permission? [Y/N]'
    parent_permission = gets.chomp.capitalize
    case_parent_permission(parent_permission)

    student = Student.new(age, name, parent_permission)
    @people.push(student)
    put_label('Person created successfully!')
  end

  # CREATE TEACHER
  def create_teacher
    age = get_input_integer('Teacher\'s Age ')
    if_age(age)

    name = get_input('Teacher\'s Name ')
    if_name(name)

    specialization = get_input('Specialization')
    if_specialization(specialization)

    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    put_label('Person created successfully!')
  end

  # CREATE BOOK
  def create_book
    title = get_input('Book Title')
    author = get_input('Author')

    book = Book.new(title, author)
    @books.push(book)
    put_label('Book created successfully!')
    store_books
  end

  # CREATE RENTAL
  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_input = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    list_people
    person_input = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_input], @people[person_input])
    @rentals.push(rental)
    put_label('Rental created successfully!')
    store_rentals
  end
end
