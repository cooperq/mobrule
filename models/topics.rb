class Topic 
  include DataMapper::Resource
  
  BLOCKED = -1
  STAND_ASIDE = 0
  CONSENT = 1

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
  property :private, Boolean

  has n, :votes

  def blocked?
    return self.blocks > 0
  end

  def blocks
    Vote.all({:topic_id=>self.id, :vote=>BLOCKED}).length
  end

  def stand_asides
    Vote.all({:topic_id=>self.id, :vote=>STAND_ASIDE}).length
  end

  def consents
    Vote.all({:topic_id=>self.id, :vote=>CONSENT}).length
  end

end

Topic.auto_upgrade!
