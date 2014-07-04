get '/index' do
  string = ""
  Gist.all.each do |i|
	string << "<a href=\"./code/#{i.id}\">#{i.id}</a><br>"
  end
  string
end

get '/' do
  haml :home
end