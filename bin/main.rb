# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/scanner.rb'

read = Scanner.new('style.css')
temp = read.indentation
puts read.log
puts "temp = #{temp[0]}"
puts "temp = #{temp[1]}"
