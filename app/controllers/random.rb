module Site
	module Routes
		class Random < Sinatra::Application
			helpers Helpers

			get '/random/?' do
				gist = get_random_gist
				redirect to("/code/#{gist.id}")
			end
		end
	end
end