# frozen_string_literal: true

require_relative '../lib/coloring.rb'

# Log Every Data Displayed
class Log
  attr_reader :log

  def initialize
    @log = "\n"
  end

  def warning(issue, code, line, expect)
    @log += 'DRev '.magenta.bold
    @log += "#{issue} "
    @log += "Warning:[#{code}]\n".yellow.bold
    @log += "    Line #{line}: ".cyan
    @log += "#{expect}\n\n"
  end

  def error(issue, code, line, expect, stoped)
    @log += 'DRev '.magenta.bold
    @log += "#{issue} "
    @log += "Error:[#{code}]\n".red.bold
    @log += "    Line #{line}: ".cyan
    @log += "#{expect}\n"
    @log += "Stoped Looking for #{stoped} Issues Due To This Error\n\n".red
  end
end
