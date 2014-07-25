module Site
	module Routes
		class Home < Sinatra::Application
			helpers Helpers
			get '/home' do
				p tmp
			  @gists = [Gist.all.sample, Gist.all.sample, Gist.all.sample]
			  @leasure = Gist.get(1046)
			  @recipe = Gist.get(1)
			  haml :home
			end
		end
	end
end