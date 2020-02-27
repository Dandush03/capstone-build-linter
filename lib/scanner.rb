require_relative '../lib/buffer.rb'

class Scanner
	attr_reader :lines, :file
	def initialize(path)
		@file = Buffer.new(path)
		@file.read
		@lines = @file.lines
	end

	def indentation
		@lines.each_with_index do |line, index|
				puts line[/\A */].size
		end
	end
end