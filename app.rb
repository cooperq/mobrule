require 'rubygems'
require 'sinatra'
require 'haml'
require 'datamapper'
require 'models/lib'

get '/' do
 haml :index
end

#view a specific consensus
#also shows the list of votes
get '/:consensus' do
  @topic
  haml :consensus
end

#create a consensus
get ':consensus/new' do
  haml :new_consensus
end

#update a consensus
get ':consensus/:hash' do
  haml :consensus_form
end

post ':consensus/:hash' do
  #consensus.save!
end

#delete a consensus
delete ':consensus/:hash' do
  #consensus.delete
end
#submit a vote
post ':consensus/vote' do
  #vote.save!
end

#form to submit a vote
get ':consensus/vote' do
  haml :vote_form
end

