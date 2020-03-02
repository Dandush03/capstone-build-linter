require_relative 'buffer.rb'
require_relative 'log.rb'

module DRev
  # Review Files For Errors
  class Scanner
    attr_reader :lines, :file, :log, :cnt, :idnt
    def initialize(path)
      @log = Log.new
      @file = Buffer.new(path)
      @path = path
      @file.read
      @lines = @file.lines
      @line = 1
    end

    def reset
      @cnt = 0
      @idnt = 0
      @line = 1
    end

    # rubocop: disable Metrics/CyclomaticComplexity
    # rubocop: disable Metrics/PerceivedComplexity
    def indentation_fun(line, index)
      if @idnt != @cnt && line.split.empty? == false
        @log.log("W_201 #{@path} #{@line} #{@cnt} #{@idnt}")

      elsif line.split.empty? == true

        return if @file.line_num - 1 == index

        return if @lines[index + 1].match(/{/)

        return if @lines[index + 1].match(/,/)

        @log.log("W_205 #{@path} #{@line} #{@cnt} #{@idnt}")
      end
    end

    def indentation
      reset
      @lines.each_with_index do |line, index|
        @idnt = line[/\A */].size
        @cnt -= 2 if line.match(/}/)
        break if indent_error_opening(@cnt)

        indentation_fun(line, index)
        @cnt += 2 if line.match(/{/)
        @line += 1
      end
      indent_error_closing(@idnt, @cnt)
    end

    def indent_error_opening(counter)
      bool = false
      if counter.negative?
        @log.log("E_101 #{@path} #{@line}")
        bool = true
      end
      bool
    end

    def indent_error_closing(indent, counter)
      bool = false
      if indent < counter
        @log.log("E_101 #{@path} 'EoF'")
        bool = true
      end
      bool
    end

    def line_after_block
      cnt = 0
      @lines.each_with_index do |line, index|
        return 1 if index > @lines.length - 2

        cnt += 1 if line.match(/{/)
        cnt -= 1 if line.match(/}/)
        next unless line.match(/}/)

        next if @lines[index + 1].strip.empty? || @lines[index + 1].match(/}/)

        @log.log("W_202 #{@path} #{index + 1} \t \t")
      end
    end
    # rubocop: enable Metrics/CyclomaticComplexity
    # rubocop: enable Metrics/PerceivedComplexity

    def end_ln
      temp = @lines[@file.line_num - 1]
      temp1 = @lines[@file.line_num]
      end_ln_b(temp, temp1)
      end_ln_a(temp, temp1)
    end

    def end_ln_b(temp, temp1)
      return if temp.nil? || temp.strip.empty?

      return if temp1.nil? || temp1.strip.empty?

      @log.log("W_204 #{@path} #{@lines.length + 1} \t \t")
    end

    def end_ln_a(temp, temp1)
      return unless temp.nil? || temp.strip.empty?

      return unless temp1.nil? || temp1.strip.empty?

      @log.log("W_203 #{@path} #{@lines.length} \t \t")
    end

    def scn
      indentation
      line_after_block
      end_ln
      @log.filter
      @log.err_list
      @log.error_list
    end
  end
end
