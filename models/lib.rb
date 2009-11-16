DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/consensus.db")

require 'models/votes'
require 'models/topics'
Vote.auto_upgrade!
Topic.auto_upgrade!
