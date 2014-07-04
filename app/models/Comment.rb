class Comment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :comment, Text
  property :created_at, DateTime
  property :gist_id, Integer
  property :score, Integer

  belongs_to :gist

end