#!/usr/bin/env ruby
#
#
# files
    # root
    # path
    # puid
    # sha1
    # size
# roots
    # name
    # path
    # enabled?

require 'rubygems'
require 'mongo'
require 'progress'
require 'sequel'

DB    = Sequel.connect( 'postgres://localhost/ben' )[ :mp3s ]
MONGO = Mongo::Connection.new.db( 'culler' ).collection( 'files' )
MONGO.remove

mp3_count = DB.count

DB.with_progress('Import').each do |mp3|
  mp3.delete :fingerprinted
  mp3.delete :hashed

  MONGO.insert( mp3 )
end
