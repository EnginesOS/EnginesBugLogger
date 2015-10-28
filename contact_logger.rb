require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

post '/api/v0/contact/bug_reports' do
  path = ENV['LIVE'].nil? ? './../contact/bug_reports/' : '/home/fs/bug_reports/'
  File.write( path + Time.now.to_s + '.bug', request.env["rack.request.form_hash"])
  redirect ( '/api/v0/contact/submitted?return_url=' + params['return_url'].to_s ) unless params['return_url'].nil?
end

get '/api/v0/contact/submitted' do
"
<html>
<head>
<style>
body {text-align: center; font-family: arial;}
.dialog {display: inline-block; border: 1px solid #CCC; border-radius: 6px; padding: 15px; margin-top: 50px}
</style>
</head>
<body>
<div class='dialog'>
  <h2>Thanks!</h2><p>returning to Engines<br>#{params['return_url']}</p>
</div>
<script>
setTimeout(function(){ window.location = '#{params['return_url']}'; }, 500);
</script>
</body>
</html>
"
end

# get "api"

get '/api/v0/software' do
  [{label: 'Owncloud', detail: 'Access your data from all your devices', \
    repository_url: 'https://github.com/EnginesBlueprints/OwnCloud.git', \
    name: 'owncloud', \
    icon_url: 'https://owncloud.org/wp-content/themes/owncloudorgnew/assets/img/common/favicon.png'}].to_json
end
