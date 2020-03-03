# rubocop: disable Naming/MethodName

module DRev
  # Error List of Class
  class Error
    attr_reader :msg
    def initialize
      @msg = []
      log = %w[lvl code type type_msg error exit line path]
      @msg << log
    end

    def E_101(path, line)
      log = []
      log << 1
      log << 101
      log << 1
      log << 'Missing Bracked'
      log << 'Expected Closing Braked'
      log << 'Stoped Looking for Indentation in this File'
      log << line
      log << path
      log
    end

    def W_201(path, line, exp, act)
      log = []
      log << 2
      log << 201
      log << 1
      log << 'Indentation'
      log << "Expected indent of #{exp} spaces not #{act} spaces"
      log << ''
      log << line
      log << path
      log
    end

    def W_202(path, line, _exp = nil, _act = nil)
      log = []
      log << 2
      log << 202
      log << 2
      log << 'Missing Line'
      log << 'Expected Empty Line Before Opening Brakect'
      log << ''
      log << line
      log << path
      log
    end

    def W_203(path, line, _exp = nil, _act = nil)
      log = []
      log << 2
      log << 203
      log << 3
      log << 'End of File'
      log << 'Expected Only One Empty Line At the End of the File'
      log << ''
      log << line
      log << path
      log
    end

    def W_204(path, line, _exp = nil, _act = nil)
      log = []
      log << 2
      log << 204
      log << 3
      log << 'End of File'
      log << 'Missing One Empty Line At the End of the File'
      log << ''
      log << line
      log << path
      log
    end

    def W_205(path, line, _exp = nil, _act = nil)
      log = []
      log << 2
      log << 205
      log << 2
      log << 'Extra Line'
      log << 'Unexpected Empty Line'
      log << ''
      log << line
      log << path
      log
    end
  end
end
# rubocop: enable Naming/MethodName
