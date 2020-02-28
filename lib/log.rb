# frozen_string_literal: true

require_relative '../lib/coloring.rb'
require_relative '../lib/error.rb'

# Log Every Data Displayed
class Log
  attr_reader :log, :error_list
  attr_accessor :logger

  def initialize
    @err = Error.new
    @logger = []
    @error_list = "\n"
  end

  def log(e)
    e = e.split
    @logger << @err.send(e[0],"#{e[1]}", "#{e[2]}") if e.length == 3
    @logger << @err.send(e[0],"#{e[1]}", "#{e[2]}", "#{e[3]}", "#{e[4]}") if e.length == 5
  end

  def filter
    @logger.each do |log|
      if log[0] == 1 && log[2] == 1
        @logger.each do |item|
          if item[0] == 2 && item[2] == 1
            @logger = @logger.reject{|search| search == item}
          end
        end
      end
    end
  end

  def err_list
    @logger.each do |log|
      @error_list += 'DRev '.magenta.bold
      @error_list += "#{log[3]} "
      @error_list += "Error:[#{log[1]}]\n".red.bold if log[0] == 1
      @error_list += "Warnning:[#{log[1]}]\n".yellow.bold if log[0] == 2
      @error_list += "    #{log[7]}/Line #{log[6]}: ".cyan
      @error_list += "#{log[4]}\n"
      @error_list += "\n".red if log[5].split.empty?
      @error_list += "#{log[5]}\n\n".red unless log[5].split.empty?
    end
  end
end
