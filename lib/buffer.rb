# frozen_string_literal: true

# Start Reading the File and check some values
class Buffer
  attr_accessor :lines
  attr_reader :file, :line_num

  def initialize(file)
    @lines = []
    @file = file
    @line_num = 0
  end

  def read
    File.open(@file).each do |line|
      @lines << line
      @line_num += line.count("\n")
    end
    @lines
  end
end
