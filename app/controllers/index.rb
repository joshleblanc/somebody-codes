module Site
	module Routes
		class Index < Sinatra::Application
			helpers Helpers

			get '/index' do
				string = ""
				Gist.all.each do |i|
					string << "<a href=\"./code/#{i.id}\">#{i.id}</a><br>"
				end
				string
			end

			get '/' do
				redirect to('/home')
			end
		end
	end
end


