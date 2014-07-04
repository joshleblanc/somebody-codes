helpers do
  def js(*s)
	string = ''
	s.each do |i|
    	string << "<script type='text/javascript' src=/js/#{i}.js></script>"
	end
	string
  end
end