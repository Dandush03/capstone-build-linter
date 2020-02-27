# frozen_string_literal: true

# rubocop: disable Metrics/MethodLength
# Start Reading the File and check some values
class Buffer
  attr_accessor :lines
  attr_reader :file, :log

  def initialize(file)
    @lines = []
    @file = file
    @log = ''
  end

  def read
    File.open(@file).each { |line| @lines << line }
    @lines
  end
end

# rubocop: enable Metrics/MethodLength
