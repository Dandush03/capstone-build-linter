require_relative '../lib/buffer.rb'

class Scanner
	attr_reader :lines, :file
	def initialize(path)
		@file = Buffer.new(path)
		@file.read
		@lines = @file.lines
	end

	def indentation
		indent = 0
		counter = 0
		@lines.each_with_index do |line, index|
			indent = line[/\A */].size
			counter -= 1 if line.match(/}/)
			if indent != counter * 2 
				puts "DLint Indentation Error:\n  Line #{index + 1}: expected indent of #{counter * 2} not #{indent}" 
			end
			counter += 1 if line.match(/{/)
		end
	end
end