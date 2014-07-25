require 'sinatra'
require 'sinatra/base'
require 'sinatra/static_assets'
require 'sinatra/cookies'
require 'haml'
require 'savon'
require 'data_mapper'
require 'octokit'
require 'pp'
require 'open-uri'
require 'stringio'
require 'rack'

module Site
	class App < Sinatra::Application
		DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/data.db")

		Dir["./app/helpers/*.rb"].each { |file| require file }
		Dir["./app/models/*.rb"].each { |file| require file }
		Dir["./app/controllers/*.rb"].each { |file| require file }

		helpers Site::Helpers

		use Routes::Home
		use Routes::About
		use Routes::Code
		use Routes::Index
		use Routes::List
		use Routes::Random
		use Routes::Submit

		DataMapper.auto_upgrade!
		DataMapper.finalize
	end

end
