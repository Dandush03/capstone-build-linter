# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'

read = Scanner.new('style.css')
read.indentation
read.line_after_block
puts read.log
