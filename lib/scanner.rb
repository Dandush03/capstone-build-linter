# frozen_string_literal: true

require_relative 'buffer.rb'
require_relative 'log.rb'

# Review Files For Errors
class Scanner
  attr_reader :lines, :file, :log
  def initialize(path)
    @log = Log.new
    @file = Buffer.new(path)
    @path = path
    @file.read
    @lines = @file.lines
    @line = 1
  end

  def indentation
    @line = 1
    indent = 0
    counter = 0
    @lines.each_with_index do |line, index|
      indent = line[/\A */].size
      counter -= 1 if line.match(/}/)
      break if indent_error_opening(counter, index)

      @log.log("W_201 #{@path} #{@line} #{counter * 2} #{indent}") if indent != counter * 2
      counter += 1 if line.match(/{/)
      @line += 1
		end
		indent_error_closing(indent, counter)
  end

  def indent_error_opening(counter, index)
    bool = false
    if counter.negative?
      @log.log("E_101 #{@path} #{@line}")
      bool = true
    end
    bool
	end
	
	def indent_error_closing(indent, counter)
    bool = false
    if indent < counter
      temp = 'Expected Closing Braked'
      # @log.error('Missing Bracked', 101, 'EoF', temp, 'Indentation')
      @log.log("E_101 #{@path} 'EoF'")
      bool = true
    end
    bool
  end

  def line_after_block
    @lines.each_with_index do |line, index|
      return 1 if index > @lines.length - 2

      next unless line.match(/}/)

      next if @lines[index + 1].strip.empty?

      #@log.warning('Empty Line Missing', 202, index + 1, 'Expected Empty Line')
      @log.log("W_202 #{@path} #{@line} \t \t")
    end
  end
end
