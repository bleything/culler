# ugh. this sucks, but it's this or literally 2000+ lines of warnings
# from mongomapper et al
$VERBOSE = false

require 'minitest/unit'
require 'culler'

MongoMapper.connection = Mongo::Connection.new
MongoMapper.database   = 'culler-test'

### drop the database so it is recreated cleanly
MongoMapper.connection.drop_database( 'culler-test' )
