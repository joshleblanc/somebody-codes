get '/' do
  content_type :json
  gist = get_random_gist
  user = User.all(gist_id: gist.id)
  p gist, user
  print gist.content
  gist.content
  #haml :index
end
