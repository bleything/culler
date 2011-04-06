require 'mongoid'
Mongoid.configure {|c| c.master = Mongo::Connection.new.db('culler') }

class Culler
  VERSION = '0.0.1'
end

require 'culler/file'
require 'culler/root'
