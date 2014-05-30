require 'sinatra'
require 'sinatra/static_assets'
require 'sinatra/cookies'
require 'haml'
require 'savon'
require 'data_mapper'
require 'octokit'
require 'pp'
require 'open-uri'
require 'stringio'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/data.db")

configure do
	set :views, ['app/views/layouts', 'app/views/pages', 'app/views/partials']
	set :root, File.dirname(__FILE__)
	set :session_secret, "thisstringwillnotchange"
	set :protection, except: :session_hijacking
	enable :run
	enable :static
	enable :sessions
end

Octokit.configure do |c|
  c.netrc = true
  #c.auto_paginate = true
end

Dir["./app/models/*.rb"].each { |file| require file }
Dir["./app/helpers/*.rb"].each { |file| require file }
Dir["./app/controllers/*.rb"].each { |file| require file }

DataMapper.auto_upgrade!
DataMapper.finalize
