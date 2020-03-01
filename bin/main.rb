# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'
def init_read(file)
  read = DRev::Scanner.new(file)
  print read.scn
end

# rubocop: disable Metrics/AbcSize

def init_start(counter)
  drev_str = "\n  Starting ".green
  drev_str += 'DRev'.magenta.bold
  drev_str += ' Inspecting '.green
  drev_str += "#{counter} ".yellow.bold
  drev_str += 'Files'.green if counter < 1
  drev_str += 'File'.green if counter >= 1
  drev_str += "\n"
  drev_str
end

def init_end(counter)
  drev_str = '  Finished '.green
  drev_str += 'DRev'.magenta.bold
  drev_str += ' Reviewing '.green
  drev_str += "#{counter} ".yellow.bold
  drev_str += 'Files'.green if counter < 1
  drev_str += 'File'.green if counter >= 1
  drev_str += "\n\n"
  drev_str
end

# rubocop: enable Metrics/AbcSize

files = Dir.glob(File.join('**', '*.css')).reject { |f| f['spec/'] }
puts init_start(files.count)
counter = 0
files.each do |file|
  counter += 1
  puts ''
  init_read(file)
end
puts init_end(counter)
