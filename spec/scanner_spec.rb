# frozen_string_literal: true

require_relative '../lib/scanner.rb'

RSpec.describe DRev do
  scn = DRev::Scanner.new('spec/test.css')
  temp = scn.scn

  describe '#check_file' do
    it "return true if there's any file in" do
      expect(scn.file.nil?).to eql(false)
    end
  end

  describe '#check_lines' do
    it "return true if there's any file buffering" do
      expect(scn.file.read.is_a?(Array)).to eql(true)
    end
  end

  describe '#check_log' do
    it "return true if there's any log in" do
      expect(scn.log.logger.size.negative?).to eql(false)
    end
  end

  describe '#check_msg' do
    it "review msg length to validate there's any text" do
      expect(temp.size.negative?).to eql(false)
    end
  end
end
