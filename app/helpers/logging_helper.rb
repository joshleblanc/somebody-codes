module Site
	module Helpers
		def log(*str)
			print "\n** ** LOG ** **\n"
			str.each do |s|
				print s + "\n"
			end
			print "** ** END ** **\n"
		end
	end
end