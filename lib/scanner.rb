# frozen_string_literal: true

require_relative '../lib/buffer.rb'
require_relative '../lib/coloring.rb'

# Review Files For Errors
class Scanner
  attr_reader :lines, :file, :log
  def initialize(path)
    @file = Buffer.new(path)
    @file.read
    @lines = @file.lines
    @log = ''
  end

  def indentation
    indent = 0
    counter = 0
    @lines.each_with_index do |line, index|
      indent = line[/\A */].size
      counter -= 1 if line.match(/}/)
      break unless indent_error(counter, index) == false

      indent_warning(counter, index, indent)
      counter += 1 if line.match(/{/)
    end
  end

  def indent_warning(counter, index, indent)
    return unless indent != counter * 2

    @log += 'DRev '.magenta
    @log += 'Indentation '
    @log += 'Warning:[201]'.yellow
    @log += "\n  Line #{index + 1}: ".cyan
    @log += "Expected indent of #{counter * 2} not #{indent}\n"
  end

  def indent_error(counter, index)
    temp = false
    if counter.negative?
      @log += 'DRev '.magenta
      @log += 'Missing Bracked '
      @log += 'Error:[101]'.red
      @log += "\n  Line #{index + 1}: ".cyan
      @log += "Expected closing braked before this line\n"
      temp = true
    end
    temp
  end

  def line_after_block
    @lines.each_with_index do |line, index|
      return 1 if index > @lines.length - 2

      next unless line.match(/}/)

      next if @lines[index + 1].strip.empty?

      @log += 'DRev '.magenta
      @log += 'Empty Line Missing '
      @log += 'Warning:[202]'.yellow
      @log += "\n  Line #{index + 1}: ".cyan
      @log += "Expected Empty Line\n"
    end
  end
end
