# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'



Dir.glob(File.join("**","*.css")).each do |file| 
	read = Scanner.new(file)
	read.indentation
	read.line_after_block
	
	read.log.filter
	read.log.err_list
	puts read.log.error_list
end