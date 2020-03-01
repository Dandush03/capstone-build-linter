# frozen_string_literal: true

require_relative '../lib/log.rb'

RSpec.describe DRev do
  log = DRev::Log.new

  arr_e = 'E_101 test 100'
  arr_w = 'W_201 test 100 1 2'
  log.log(arr_e)
  log.log(arr_w)

  describe '#Logger_Size' do
    it 'return true if logger = 2' do
      expect(log.logger.length == 2).to eql(true)
    end
  end

  describe '#Log_Filter' do
    it 'return true if logger size get to 1' do
      log.filter
      expect(log.logger.length == 1).to eql(true)
    end
  end

  describe '#Msg' do
    it 'return true if msg = msg' do
      log.err_list
      expect(log.error_list.length == 175).to eql(true)
    end
  end
end
