require_relative './app'

class Main
  def initialize
    @app = App.new
  end

  def welcome
    puts 'Hi! Welcome to Angels School Library'
    puts "====================================\n\n"
    full_list
  end

  def full_list
    puts "\n"
    puts 'Please choose an option by entering a number:'
    options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
               'List all rentals for a given person id', 'Exit']
    options.each.with_index(1) do |option, index|
      puts "#{index}. #{option}"
    end
    puts "\n"
    main_input = gets.chomp.to_i
    listed_sections(main_input)
  end

  def listed_sections(user_input)
    case user_input
    when 1
      @app.list_book
      full_list
    when 2
      @app.list_people
      full_list
    when 6
      @app.list_rentals
      full_list
    when 7
      puts 'Exiting program... We hope to see you soon!'
    else
      creators(user_input)
    end
  end

  def creators(creator_input)
    case creator_input
    when 3
      @app.create_person
      full_list
    when 4
      @app.create_book
      full_list
    when 5
      @app.create_rental
      full_list
    end
  end
end

main = Main.new
main.welcome
