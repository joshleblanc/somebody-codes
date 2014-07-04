get '/home' do
  @gists = [Gist.all.sample, Gist.all.sample, Gist.all.sample]

  @leasure = Gist.get(1046)
  @recipe = Gist.get(1)
  haml :home
end