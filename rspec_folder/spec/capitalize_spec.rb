require_relative 'decorator_spec'
require_relative 'person_spec'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

describe CapitalizeDecorator do
  let(:person) { Person.new(25, 'Amanda') }
  let(:capitalize) { CapitalizeDecorator.new(person) }

  describe 'When test CapitalizeDecorator functionality' do
    it 'Creates an instance of CapitalizeDecorator' do
      expect(capitalize).to be_an_instance_of(CapitalizeDecorator)
    end
  end

  describe 'When use the method with a String' do
    it 'Returns a string with first letter capitalized' do
      expect(capitalize.correct_name).to eql 'Amanda'
      expect(capitalize.correct_name).to_not eql 'amanda'
    end
  end
end
