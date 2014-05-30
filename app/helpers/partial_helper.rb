helpers do
	def render_partial(template)
   	haml template, :partial => false
   end
end
