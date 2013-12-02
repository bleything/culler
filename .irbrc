$LOAD_PATH.unshift 'lib'
require 'culler'

MongoMapper.connection = Mongo::Connection.new
MongoMapper.database   = 'culler'
