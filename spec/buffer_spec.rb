# frozen_string_literal: true

require_relative '../lib/scanner.rb'

RSpec.describe DRev do
  describe '#file_exits?' do
    it 'return true if file exists' do
      expect(File.exist?('spec/test.css')).to eql(true)
    end
  end

  buffer = DRev::Buffer.new('spec/test.css')
  buffer.read

  describe '#read' do
    it 'return true if line eq the number of line in the doc' do
      expect(buffer.line_num == 313).to eql(true)
    end
  end

  describe '#check_lines' do
    it 'return true if all file lines where readed' do
      expect(buffer.line_num == buffer.lines.length).to eql(true)
    end
  end
end
