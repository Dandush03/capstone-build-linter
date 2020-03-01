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

    def indentation_fun(line)
      if @idnt != @cnt && line.split.empty? == false
        @log.log("W_201 #{@path} #{@line} #{@cnt} #{@idnt}")
      elsif @idnt != @cnt && line.split.empty? == true
        @log.log("W_204 #{@path} #{@line} #{@cnt} #{@idnt}")
      end
    end

    def indentation
      reset
      @lines.each do |line|
        @idnt = line[/\A */].size
        @cnt -= 2 if line.match(/}/)
        break if indent_error_opening(@cnt)

        indentation_fun(line)
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
        # @log.error('Missing Bracked', 101, 'EoF', temp, 'Indentation')

        @log.log("E_101 #{@path} 'EoF'")
        bool = true
      end
      bool
    end

    def line_after_block
      @lines.each_with_index do |line, index|
        return 1 if index > @lines.length - 2

        next unless line.match(/}/)

        next if @lines[index + 1].strip.empty?

        @log.log("W_202 #{@path} #{index + 1} \t \t")
      end
    end

    def end_ln
      temp = @lines[@file.line_num - 1]
      temp2 = @lines[@file.line_num - 2]
      end_ln_b(temp, temp2)
      end_ln_a(temp)
    end

    def end_ln_b(temp, temp2)
      return unless temp.nil? || temp.strip.empty?

      return unless temp2.nil? || temp2.strip.empty?

      @log.log("W_203 #{@path} #{@lines.length + 1} \t \t")
    end

    def end_ln_a(temp)
      return if temp.nil? || temp.strip.empty?

      return unless @lines[@file.line_num - 1].match(/}/)

      @log.log("W_204 #{@path} #{@lines.length} \t \t")
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
