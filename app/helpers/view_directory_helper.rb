#Override the default view folder to look in multiple folders
#Taken from https://coderwall.com/p/ioanja
helpers do
  def find_template(views, name, engine, &block)
    views.each { |v| super(v, name, engine, &block) }
  end
end
