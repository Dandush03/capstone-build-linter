# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'
def init_read(file)
  read = Scanner.new(file)
  read.indentation
  read.line_after_block
  read.end_ln
  read.log.filter
  read.log.err_list
  print read.log.error_list
end

files = Dir.glob(File.join('**', '*.css'))
files.each do |file|
  puts ''
  init_read(file)
end
