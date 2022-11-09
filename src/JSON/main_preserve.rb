require 'json'

module MainPreserve
  def write_json(arr, path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(path, JSON.generate(arr, opts))
  end

  def read_json(path)
    return unless File.exist?(path)

    file = File.read(path)
    JSON.parse(file)
  end

  def books_reader
    parse_book = read_json('src/JSON/mybooks.json')
    parse_book.map { |book| Book.new(book['title'], book['author']) }
  end

  def people_reader
    parse_people_file = read_json('src/JSON/mypeople.json')
    parse_people_file.map do |person|
      if person['classroom'] == 'Teacher'
        Teacher.new(person['age'], person['name'], person['specialization'])
      else
        Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
      end
    end
  end

  def rentals_reader(people, books)
    parse__rentals_file = read_json('src/JSON/myrentals.json')
    parse__rentals_file.map do |rental|
      Rental.new(books[rental['book_id'].to_i], people[rental['person_id'].to_i])
    end
  end

end
