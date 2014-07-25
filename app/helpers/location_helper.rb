module Site
	module Helpers
		def is_at(loc)
			request.path_info.include? loc.to_s
		end
	end
end