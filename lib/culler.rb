require 'mongo_mapper'
MongoMapper.connection = Mongo::Connection.new
MongoMapper.database   = 'culler'

class Culler
  VERSION = '0.0.1'
end

require 'culler/file'
require 'culler/root'
