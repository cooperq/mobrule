require 'rubygems'
require 'sinatra'
require 'haml'
require 'datamapper'
require 'models/lib'
require 'prettyprint'

get '/' do
  @topics = Topic.all(:private=>nil)
  haml :index
end

get '/error/404' do
  status 404
  haml :error_404
end

get '/error/500' do
  status 500
  haml :error_500
end

#view a specific consensus
#also shows the list of votes
get '/:consensus' do
  @topic = Topic.first(:permalink=>params[:consensus])
  redirect '/error/404' if @topic.nil?
  @flash = "This topic has been blocked" if @topic.blocked?
  haml :show_consensus
end

#create a consensus
get '/consensus/new' do
  haml :new_consensus
end

post '/consensus/new' do
  c = Topic.new(params)
  c.save!
  raise params.inspect
  redirect '/' + c.permalink
end

#submit a vote
post '/:consensus/vote' do
  vote = Vote.new
  vote.vote = params[:vote]
  vote.comment = params[:comment]
  vote.topic_id = params[:topic_id]
  vote.save!
  @flash = "Thanks for your vote! It has been submitted"
  redirect '/' + params[:consensus]
end

#form to submit a vote
get '/:consensus/vote' do
  haml :vote_form
end

#update a consensus
get '/:consensus/:hash' do
  haml :consensus_form
end

post '/:consensus/:hash' do
  #consensus.save!
end

#delete a consensus
delete '/:consensus/:hash' do
  #consensus.delete
end

