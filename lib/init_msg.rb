# frozen_string_literal: true

module DRev
  # Start Const Msg
  class InitMsg
    # rubocop: disable Metrics/AbcSize
    def init_start(counter)
      drev_str = "\n  Starting ".green
      drev_str += 'DRev'.magenta.bold
      drev_str += ' Inspecting '.green
      drev_str += "#{counter} ".yellow.bold
      drev_str += 'Files'.green if counter < 1
      drev_str += 'File'.green if counter >= 1
      drev_str += "\n"
      drev_str
    end

    def init_end(counter)
      drev_str = "\n  Finished ".green
      drev_str += 'DRev'.magenta.bold
      drev_str += ' Reviewing '.green
      drev_str += "#{counter} ".yellow.bold
      drev_str += 'Files'.green if counter < 1
      drev_str += 'File'.green if counter >= 1
      drev_str += "\n\n"
      drev_str
    end

    def file_start(path, counter)
      drev_str = "\n  Start Reviewing File N° ".red
      drev_str += "#{counter}: ".yellow
      drev_str += path.to_s.magenta
      drev_str += "\n"
      drev_str
    end

    def file_end
      drev_str = '  Finished Reviewing File'.red
      drev_str
    end
    # rubocop: enable Metrics/AbcSize
  end
end
