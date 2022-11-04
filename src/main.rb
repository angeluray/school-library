require_relative './app'

class Main
  def initialize
    @app = App.new
  end

  def welcome
    puts 'Hi! Welcome to Angels School Library'
    list_options
  end

  def full_list
    puts 'Please choose an option by entering a number:'
    options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
               'List all rentals for a given person id']
    options.each.with_index(1) do |option, index|
      puts "#{index}. #{option}"
    end
  end

  def after_complete
    full_list
    after_input = gets.chomp.to_i
    case after_input
    when 1
      @app.list_book
      after_complete
    when 2
      @app.list_people
      after_complete
    when 3
      @app.create_person
      after_complete
    when 4
      @app.create_book
      after_complete
    when 5
      @app.create_rental
      after_complete
    when 6
      @app.list_rentals
      after_complete
    end
  end

  def list_options
    full_list
    user_input = gets.chomp.to_i
    case user_input
    when 1
      @app.list_book
      after_complete
    when 2
      @app.list_people
      after_complete
    when 3
      @app.create_person
      after_complete
    when 4
      @app.create_book
      after_complete
    when 5
      @app.create_rental
      after_complete
    when 6
      @app.list_rentals
      after_complete
    end
  end
end

main = Main.new
main.welcome
