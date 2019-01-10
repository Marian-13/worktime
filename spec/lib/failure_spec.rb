require_relative '../../app/lib/services/failure'

RSpec.describe Failure do
  describe '::with_desc' do
    it 'creates Failure with +desc+' do
      desc = 'Some description'

      failure = Failure.with_desc(desc)

      expect(failure.desc).to eq(desc)
    end
  end

  describe '#successful?' do
    it 'returns false' do
      failure = Failure.with_desc('Error')

      expect(failure.successful?).to eq(false)
    end
  end
end
