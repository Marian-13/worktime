require_service 'passwords/validate'

RSpec.describe Passwords::Validate do
  describe '::call' do
    context 'when +password+ is blank' do
      it 'is not successful' do
        result = Passwords::Validate.(password: '', password_confirmation: 'secret')

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password_confirmation+ is blank' do
      it 'is not successful' do
        result = Passwords::Validate.(password: 'secret', password_confirmation: '')

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ is too short' do
      it 'is not successful' do
        result = Passwords::Validate.(password: '123', password_confirmation: '123')

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ is too long' do
      it 'is not successful' do
        result = Passwords::Validate.(password: '1' * 25, password_confirmation: '1' * 25)

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ does not match +password_confirmation+' do
      it 'is not successful' do
        result = Passwords::Validate.(password: 'secret', password_confirmation: 'public')

        expect(result.successful?).to eq(false)
      end
    end

    context 'on success' do
      it 'has no value' do
        result = Passwords::Validate.(password: 'secret', password_confirmation: 'secret')

        expect(result.has_value?).to eq(false)
      end
    end
  end
end
