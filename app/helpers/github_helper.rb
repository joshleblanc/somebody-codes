helpers do
  require 'json'
  CLIENT = Octokit::Client.new

  def get_random_gist
    Gist.all.sample
  end
end
