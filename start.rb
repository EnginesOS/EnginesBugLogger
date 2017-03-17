require 'sinatra'

set :bind, '0.0.0.0'

before do
  request.body.rewind
  @bug_report = request.body.read
end

post '/v0/exception_reports' do
  File.write( path + Time.now.to_s.gsub(' ', '_') + Random.new.rand(1000).to_s + '.bug', @bug_report)
end

get '/' do
  "<h3>Engines Bug Logger v0.2<h3>"
end

def path
  settings.development? ? './../exception_reports/' : '/home/fs/exception_reports/'
end
