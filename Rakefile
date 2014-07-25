require 'open-uri'
require 'fileutils'
require 'zip/zipfilesystem'

namespace :compile do
  desc "Compiles all .scss files in the sass directory and places them in public/css (minified)"
  task :sass do
    puts "Compiling and minifying .scss files in sass/"
    scss_files = FileList['private/sass/*.scss']
    scss_files.each do |file|
      puts "Processing: #{file}"
      `sass #{file}:public/css/#{file[12..-5]}css --style compressed`
    end
  end

  desc "Compiles all .coffee files in the private/cs directory and places them in public/js"
  task :cs do
    p "Compiling and watching .coffee files in /private/cs"
    `coffee -o private/cs/ -c private/cs/`
    js_files = FileList['private/cs/*.js']
    js_files.each do |file|
      p "Processing: #{file}"
      `uglifyjs #{file} -o public/js#{file[10..-1]}`
      FileUtils.rm(file)
    end
  end
end

namespace :get do
  task :gist do
	  require './main.rb'
    require 'json'
    CLIENT = Octokit::Client.new
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
  end
end

namespace :update do
  desc "Download the latest version of JQuery (minified)"
  task :jquery do
    open('jquery.js', 'wb') do |file|
      file << open('http://code.jquery.com/jquery-latest.min.js').read
    end
    FileUtils.mv('./jquery.js', './public/js/jquery.js')
    puts "Downloaded the latest JQuery"
  end

  desc "Download the latest version of Twitter Bootstrap (minified)"
  task :bootstrap do
    open('bootstrap.zip', 'wb') do |file|
      file << open('https://github.com/twbs/bootstrap/archive/master.zip').read
    end

    Zip::ZipFile.open("bootstrap.zip") do |zipfile|
      zipfile.each do |file|
        zipfile.extract(file, "./#{file.name}")
        p "./#{file.name}"
      end
    end

    FileUtils.mv('./bootstrap-master/dist/css/bootstrap.min.css', './public/css/bootstrap.min.css')
    FileUtils.mv('./bootstrap-master/dist/fonts/glyphicons-halflings-regular.woff', './public/fonts/glyphicons-halflings-regular.woff')
    FileUtils.mv('./bootstrap-master/dist/fonts/glyphicons-halflings-regular.eot', './public/fonts/glyphicons-halflings-regular.eot')
    FileUtils.mv('./bootstrap-master/dist/fonts/glyphicons-halflings-regular.ttf', './public/fonts/glyphicons-halflings-regular.ttf')
    FileUtils.mv('./bootstrap-master/dist/fonts/glyphicons-halflings-regular.svg', './public/fonts/glyphicons-halflings-regular.svg')
    FileUtils.mv('./bootstrap-master/dist/js/bootstrap.min.js', './public/js/bootstrap.min.js')
    FileUtils.rm_r('./bootstrap-master')
    FileUtils.rm('./bootstrap.zip')

    puts "Downloaded the latest Twitter Bootstrap"
  end

  desc "Downloads the most recent versions of JQuery & Twitter Bootstrap"
  task :all do
    Rake::Task["update:jquery"].invoke
    Rake::Task["update:bootstrap"].invoke
  end

  private
    def edit_file(file_name, string, repl_string)
      File.open('tmp.txt', 'w') do |output_file|
        File.open(file_name, 'r') do |input_file|
          input_file.each_line do |line|
            output_file.print line.sub(string, repl_string)
          end
        end
      end
    File.delete(file_name)
    File.rename('tmp.txt', file_name)
    end
end

namespace :remove do
  desc "Remove JQuery from the project"
  task :jquery do
    FileUtils.rm('./public/js/jquery.js')
  end

  desc "Remove Twitter Bootstrap from the project"
  task :bootstrap do
    FileUtils.rm('./public/css/bootstrap.min.css')
    FileUtils.rm('./public/fonts/glyphicons-halflings-regular.woff')
    FileUtils.rm('./public/fonts/glyphicons-halflings-regular.eot')
    FileUtils.rm('./public/fonts/glyphicons-halflings-regular.ttf')
    FileUtils.rm('./public/fonts/glyphicons-halflings-regular.svg')
    FileUtils.rm('./public/js/bootstrap.min.js')
  end

  desc "Remove both JQuery & Twitter Bootstrap from the project"
  task :all do
    Rake::Task["remove:jquery"].invoke
    Rake::Task["remove:bootstrap"].invoke
  end

end

desc "List all routes for this application"
task :routes do
  puts `grep '^[get|post|put|delete].*do$' app/controllers/*.rb | sed 's/ do$//'`
end

task :default => ["test"]
