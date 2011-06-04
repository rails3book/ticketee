heartbeat_root = File.expand_path(File.dirname(__FILE__))
require heartbeat_root + '/application'
require heartbeat_root + '/test_application'

app = Rack::Builder.app do
  map '/test' do
    run Heartbeat::Application
  end

  map '/' do
    run Heartbeat::TestApplication
  end
end

run app