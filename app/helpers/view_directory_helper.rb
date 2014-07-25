module Site
	module Helpers
		def find_template(views, name, engine, &block)
			p "working"
			views.each { |v| super(v, name, engine, &block) }
		end

		def tmp
			p "tmp working"
		end
	end
end
