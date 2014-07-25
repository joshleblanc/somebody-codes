get '/submit' do
	haml :submit
end

module Site
	module Routes
		class Submit < Sinatra::Application
			helpers Helpers

			get '/submit/?' do
				haml :submit
			end
		end
	end
end