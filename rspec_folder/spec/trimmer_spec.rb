require_relative 'person_spec.rb'
require_relative 'decorator_spec.rb'
require_relative 'nameable_spec.rb'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0..10]
  end
end

describe TrimmerDecorator do
    let(:person) { Person.new(23, 'parangaricutirimicuaro') }
    let(:trimmer) { TrimmerDecorator.new(person) }
  
    describe 'Whe calls trimmer' do
      it 'Creates an instance' do
        expect(trimmer).to be_an_instance_of(TrimmerDecorator)
      end
    end
  
    describe 'When use trimmer correct_name' do
      it 'returns trimmed name' do
        expect(trimmer.correct_name).to eql 'parangaricu'
        expect(trimmer.correct_name).to_not eql 'parangaricutirimicuaro'
      end
    end
  end