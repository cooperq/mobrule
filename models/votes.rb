class Vote
  include DataMapper::Resource
  property :id, Serial
  property :topic_id, Integer
  property :consensus, Boolean
  property :hash, String
  property :created_at, DateTime
  property :comment, Text

  belongs_to :topic
end

