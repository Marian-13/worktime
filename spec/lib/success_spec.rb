require_lib 'services'

RSpec.describe Success do
  describe '::with_value' do
    it 'creates result with +value+' do
      value = 'Some value'

      result = Success.with_value(value)

      expect(result.has_value?).to eq(true)
      expect(result.value).to eq(value)
    end
  end

  describe '::without_value' do
    it 'creates result without a value' do
      value = 'Some value'

      result = Success.without_value

      expect(result.has_value?).to eq(false)
    end
  end

  describe '#has_value?' do
    context 'when result created with value' do
      it 'returns true' do
        result = Success.with_value('Some value')

        expect(result.has_value?).to eq(true)
      end
    end

    context 'when success created without value' do
      it 'returns false' do
        result = Success.without_value

        expect(result.has_value?).to eq(false)
      end
    end
  end

  describe '#value' do
    context 'when result has value' do
      it 'returns that value' do
        value = 'Some value'

        result = Success.with_value(value)

        expect(result.value).to eq(value)
      end
    end

    context 'when result does not have value' do
      it 'raises AccessToUnsetValueError' do
        result = Success.without_value

        expect { result.value }.to raise_error(Success::AccessToUnsetValueError)
      end
    end
  end

  describe '#successful?' do
    it 'returns true' do
      result = Success.with_value('Some value')

      expect(result.successful?).to eq(true)
    end
  end
end
