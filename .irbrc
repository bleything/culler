$LOAD_PATH.unshift 'lib'
require 'culler'

Mongoid.configure do |c|
  c.master = Mongo::Connection.new.db( 'culler' )

  # disable dynamic fields so the tests blow up if we try to access a
  # field that doesn't exist. This is done only in test/dev because we
  # don't want to assume how people are going to use their culler data
  # in actual use.
  c.allow_dynamic_fields = false
end
