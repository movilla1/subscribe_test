# frozen_string_literal: true

# This class implements common routines for all services.
class BaseService
  def initialize(debug: false)
    @debug = debug
  end

  def debug_output(title, data)
    return unless @debug

    pp title
    pp data
  end
end
