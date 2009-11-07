class Vote
  include DataMapper::Resource
  
  BLOCKED=-1
  STAND_ASIDE=0
  CONSENT=1
  
  property :id, Serial
  property :topic_id, Integer
  property :vote, Integer
  property :hash, String
  property :created_at, DateTime
  property :comment, Text

  belongs_to :topic

  def blocked?
    return self.vote != CONSENT
  end

end

