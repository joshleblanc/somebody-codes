module Site
	module Routes
		class List < Sinatra::Application
			helpers Helpers

			get '/list/?' do
				@gists = Gist.all
				haml :list
			end
		end
	end
end