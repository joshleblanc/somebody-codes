module Site
	module Helpers
		def render_partial(template)
			haml template, :partial => false
		end

		def render_comment(comment)
			@name = comment.name
			@date = comment.created_at
			@comment = comment.comment
			haml :comment, partial: false
		end

		def render_gist_summary(gist)
			@name = gist.file_name
			p User.all(gist_id: gist.id)
			@author = User.all(gist_id: gist.id).first.name
			@description = gist.description
			haml :gist_summary, partial: false
		end
	end
end
