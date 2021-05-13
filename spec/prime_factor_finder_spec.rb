require_relative '../lib/prime_factor_finder'

RSpec.describe PrimeFactorFinder do
  subject { described_class.new(10) }

  describe '#initialize' do
    it 'has a number attribute' do
      expect(subject.number).to eq 10
    end

    context 'given number is negative' do
      it 'raises a custom exception' do
        expect{ described_class.new(-1) }.to raise_error(InvalidIntegerError)
      end
    end
  end

  describe '#prime_factors' do
    it 'returns an array of all PRIME factors within the range of the given integer' do
      expect(subject.prime_factors).to eq([2,5])
    end

    context '#large_integers' do
      subject { described_class.new(2346623254324) }

      it 'returns an array of all PRIME factors within the range of the given integer' do
        expect(subject.prime_factors).to eq([2, 157, 3736661233])
      end
    end
  end
end
