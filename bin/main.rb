# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'
def init_read(file)
  read = DRev::Scanner.new(file)
  print read.scn
end

files = Dir.glob(File.join('**', '*.css')).reject { |f| f['spec/'] }
counter = files.count
files.each do |file|
  puts ''
  init_read(file)
end
