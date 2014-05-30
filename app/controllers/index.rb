get '/' do

  @gist = get_random_gist
  @user = User.all(gist_id: @gist.id).first
  p @user
  haml :index
end
