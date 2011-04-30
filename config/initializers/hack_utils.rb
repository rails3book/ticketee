require "rack/utils"

module Rack::Utils
  def escape(s)
    s.to_s.gsub(/([^ a-zA-Z0-9_.-]+)/) {
      '%'+$1.unpack('H2'*bytesize($1)).join('%').upcase
    }.tr(' ', '+')
  end
  module_function :escape
end