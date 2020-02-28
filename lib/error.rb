# frozen_string_literal: true

# rubocop: disable Naming/MethodName

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
    log << 'Stoped Looking for Indentation Issues Due To This Error'
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
	
	def W_202(path, line, exp = nil, act = nil)
    log = []
    log << 2
    log << 202
    log << 2
    log << 'Missing Line'
    log << "Expected Empty Line Before Opening Brakect"
    log << ''
    log << line
    log << path
    log
  end
end
# rubocop: enable Naming/MethodName
