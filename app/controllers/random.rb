get '/random/?' do
  gist = get_random_gist
  redirect to("/code/#{gist.id}")
end

