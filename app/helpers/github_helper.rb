module Site
	module Helpers
		def get_random_gist
			Gist.all.sample
		end
	end
end
