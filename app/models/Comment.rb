class Comment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :comment, Text
  property :score, Integer

end