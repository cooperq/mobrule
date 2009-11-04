class Topic 
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :description, String
  property :created_at, DateTime
  property :end_date, DateTime
  property :needed_votes, Integer
  property :tolerance, Integer
  property :contact_email, String
  property :permalink, String
  property :hash, String
  has n, :votes
end
