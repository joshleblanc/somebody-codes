require './main'
set :views, ['app/views/pages', 'app/views/partials', 'app/views/layouts']
set :root, File.dirname(__FILE__)
set :session_secret, "thisstringwillnotchange"
set :protection, except: :session_hijacking
enable :run
#enable :static
enable :sessions
disable :method_override
run Site::App