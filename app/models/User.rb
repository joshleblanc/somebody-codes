class User
  include DataMapper::Resource


  property :id, Serial
  property :name, String
  property :full_address, String
  property :gist_id, String

end