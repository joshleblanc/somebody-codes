helpers do
  require 'json'
  CLIENT = Octokit::Client.new

  def get_random_gist()
    gists =  CLIENT.public_gists
    gists.each do |i|
      dets = i[:files].to_h.flat_map { |_, v| { filename: v[:filename], language: v[:language], raw_url: v[:raw_url] } }
      if dets.length > 0
        dets.each do |j|
          det = j
          error = false
          content = open(raw_url).read rescue error = true
          unless error
            g = Gist.first_or_create(file_name: det[:filename], language: det[:language],
                                 full_address: i[:html_url], raw_address: det[:raw_url],
                                 description: i[:description], content: content)
            User.first_or_create(name: i[:owner][:login], full_address: i[:owner][:html_url], gist_id: g.id)
          end
        end
      end
    end
    Gist.all.sample
  end
end
