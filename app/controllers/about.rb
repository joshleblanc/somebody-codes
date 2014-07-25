module Site
	module Routes
		class About < Sinatra::Application
			helpers Helpers
			get '/about' do
				haml :about
			end
		end
	end
end