require_relative '../files_needed'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

describe BaseDecorator do
  let(:person1) { Person.new(18, 'Parangaricutirimicuaro') }
  let(:base) { BaseDecorator.new(person1) }
  let(:trim) { TrimmerDecorator.new(person1) }
  let(:capitalize) { CapitalizeDecorator.new(person1) }
  let(:capitalize_trim) { CapitalizeDecorator.new(trim) }

  describe 'When call the base decorator' do
    it 'Creates an instance of it' do
      expect(base).to be_instance_of BaseDecorator
    end
  end

  describe 'After call it and correct name' do
    it 'returns the string trimmed and capitalize the 1st letter' do
      expect(base.correct_name).to eql 'Parangaricutirimicuaro'
      expect(trim.correct_name).to eql 'Parangaricu'
      expect(capitalize.correct_name).to eql 'Parangaricutirimicuaro'
      expect(capitalize_trim.correct_name).to eql 'Parangaricu'
    end
  end
end
