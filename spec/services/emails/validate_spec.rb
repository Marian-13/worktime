require_service 'emails/validate'

RSpec.describe Emails::Validate do
  describe '::call' do
    context 'when +email+ is blank' do
      it 'is not successful' do
        result = Emails::Validate.(email: '')

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +email+ does not include at sign(@)' do
      it 'is not successful' do
        result = Emails::Validate.(email: 'mariankostyk13895gmail.com')

        expect(result.successful?).to eq(false)
      end
    end

    context 'on success' do
      it 'has no value' do
        result = Emails::Validate.(email: 'mariankostyk13895@gmail.com')

        expect(result.has_value?).to eq(false)
      end
    end
  end
end
