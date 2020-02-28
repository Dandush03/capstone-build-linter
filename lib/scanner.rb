# frozen_string_literal: true

require_relative '../lib/buffer.rb'

# Review Files For Errors
class Scanner
  attr_reader :lines, :file, :log
  def initialize(path)
    @file = Buffer.new(path)
    @file.read
    @lines = @file.lines
    @log = ''
  end
  # rubocop: disable Metrics/MethodLength

  def indentation
    indent = 0
    counter = 0
    @lines.each_with_index do |line, index|
      indent = line[/\A */].size
      counter -= 1 if line.match(/}/)
      if indent != counter * 2
        @log += "DLint Indentation Error:\n  Line #{index + 1}: "
        @log += "expected indent of #{counter * 2} not #{indent}\n"
      end
			if counter < 0
        @log += "DLint Missing Bracked Error:\n  Line #{index + 1}: "
        @log += "expected closing braked before this line\n"
			end
      counter += 1 if line.match(/{/)
    end
  end

  # rubocop: enable Metrics/MethodLength
end
