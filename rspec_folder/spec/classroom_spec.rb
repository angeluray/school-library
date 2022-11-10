require_relative 'student_spec'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

describe Classroom do
  let(:classroom) { Classroom.new('Science') }

  describe 'When call the classroom variable' do
    it 'returns an instance of Classroom' do
      expect(classroom).to be_instance_of Classroom
    end
  end

  describe 'Add a label' do
    it 'has a label "Science"' do
      expect(classroom.label).to eq 'Science'
    end
  end

  describe 'Add a student' do
    it 'Add a new student into student classroom' do
      classroom.add_student(Student.new(15, 'Melanie', true))
      classroom.add_student(Student.new(20, 'Austria', false))
      expect(classroom.students.size).to eql 2
    end
  end
end
