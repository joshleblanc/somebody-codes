get '/code/:id' do
  p params[:id]
  @gist = Gist.get(params[:id])
  @user = User.all(gist_id: @gist.id).first
  @comments = Comment.all(gist_id: @gist.id, limit: 25, order: [:created_at.desc])
  haml :gist
end

post '/code/:id' do
  DataMapper::Model.raise_on_save_failure = true
  time = Time.now
  name = params[:name]
  comment = params[:comment].gsub(/\n+/, "\n").gsub(/\r+/, "\n").gsub(/\n+/, "\n").gsub(/ +/, ' ')

  if not comment.gsub(" ", "").gsub('\n', '').gsub('\r','').empty? and not name.gsub(' ', '').empty?
	Comment.first_or_create({
								name: name,
								comment: comment,
								gist_id: params[:id]}, {
								created_at: time}
	)
  end
  redirect to("/#{params[:id]}")
end