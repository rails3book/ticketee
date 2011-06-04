module Heartbeat
  class Application
    def self.call(env)
      default_headers = { "Content-Type" => "text/plain"}

      if env["PATH_INFO"] =~ /200/
        body = "Success!"
        status = 200
      else
        body = "Failure!"
        status = 500
      end

      [status, default_headers, ["#{env["PATH_INFO"]} == #{body}"]]
    end
  end
end