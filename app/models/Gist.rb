class Gist
  include DataMapper::Resource
  property :id, Serial
  property :file_name, Text
  property :language, Text, required: false
  property :full_address, Text
  property :raw_address, Text
  property :description, Text, required: false
  property :content, Text

  has n, :comments
  has 1, :user

end