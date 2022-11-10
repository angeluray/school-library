class Nameable
  def correct_name
    raise NotImplementedError, 'This is an error'
  end
end

describe Nameable do
  let(:nameable) { Nameable.new }

  describe 'When call Nameable' do
    it 'Creates an instance' do
      expect(nameable).to be_instance_of(Nameable)
    end
  end

  describe 'When raise the error' do
    it 'returns an error notification' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
