require_service 'users/register'

RSpec.describe Users::Register do
  describe '::call' do
    context 'when +password+ is blank' do
      it 'is not successful' do
        result = Users::Register.(
          password: '',
          password_confirmation: 'secret',
          email: 'mariankostyk13895@gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password_confirmation+ is blank' do
      it 'is not successful' do
        result = Users::Register.(
          password: 'secret',
          password_confirmation: '',
          email: 'mariankostyk13895@gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ is too short' do
      it 'is not successful' do
        result = Users::Register.(
          password: '123',
          password_confirmation: '123',
          email: 'mariankostyk13895@gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ is too long' do
      it 'is not successful' do
        result = Users::Register.(
          password: '1' * 25,
          password_confirmation: '1' * 25,
          email: 'mariankostyk13895@gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +password+ does not match +password_confirmation+' do
      it 'is not successful' do
        result = Users::Register.(
          password: 'secret',
          password_confirmation: 'public',
          email: 'mariankostyk13895@gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +email+ is blank' do
      it 'is not successful' do
        result = Users::Register.(
          password: 'secret',
          password_confirmation: 'public',
          email: ''
        )

        expect(result.successful?).to eq(false)
      end
    end

    context 'when +email+ does not include at sign(@)' do
      it 'is not successful' do
        result = Users::Register.(
          password: 'secret',
          password_confirmation: 'public',
          email: 'mariankostyk13895gmail.com'
        )

        expect(result.successful?).to eq(false)
      end
    end
  end
end
