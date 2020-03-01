require_relative '../lib/error.rb'

# rubocop: disable Naming/VariableNumber

RSpec.describe DRev do
  err = DRev::Error.new

  e_101 = err.E_101('test', 123)
  describe '#check_101' do
    it 'return true if error' do
      expect(e_101[0] + e_101[2] == 2).to eql(true)
    end
  end

  w_201 = err.W_201('test', 123, 1, 2)
  describe '#check_201' do
    it 'return true if error' do
      expect(w_201[0] + w_201[2] == 3).to eql(true)
    end
  end

  w_202 = err.W_202('test', 123)
  describe '#check_202' do
    it 'return true if error' do
      expect(w_202[0] + w_202[2] == 4).to eql(true)
    end
  end

  w_203 = err.W_203('test', 123)
  describe '#check_203' do
    it 'return true if error match' do
      expect(w_203[0] + w_203[2] == 5).to eql(true)
    end
  end

  w_204 = err.W_204('test', 123)
  describe '#check_204' do
    it 'return true if error match' do
      expect(w_204[0] + w_204[2] == 5).to eql(true)
    end
  end
end
# rubocop: enable Naming/VariableNumber
