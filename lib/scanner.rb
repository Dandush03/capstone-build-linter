# frozen_string_literal: true

require_relative 'buffer.rb'
require_relative 'log.rb'

# Review Files For Errors
class Scanner
  attr_reader :lines, :file, :log
  def initialize(path)
    @file = Buffer.new(path)
    @file.read
    @lines = @file.lines
    @log = Log.new
  end

  def indentation
    indent = 0
    counter = 0
    @lines.each_with_index do |line, index|
      indent = line[/\A */].size
      counter -= 1 if line.match(/}/)
      break if indent_error(counter, index)

      indent_warning(counter, index, indent) if indent != counter * 2
      counter += 1 if line.match(/{/)
    end
  end

  def indent_warning(counter, index, indent)
    temp = "Expected indent of #{counter * 2} spaces not #{indent} spaces"
    @log.warning('Indentation', 201, index + 1, temp)
  end

  def indent_error(counter, index)
    bool = false
    if counter.negative?
      temp = 'Expected closing braked before this line'
      @log.error('Missing Bracked', 101, index + 1, temp, 'Indentation')
      bool = true
    end
    bool
  end

  def line_after_block
    @lines.each_with_index do |line, index|
      return 1 if index > @lines.length - 2

      next unless line.match(/}/)

      next if @lines[index + 1].strip.empty?

      @log.warning('Empty Line Missing', 202, index + 1, 'Expected Empty Line')
    end
  end
end
