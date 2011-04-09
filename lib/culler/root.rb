require 'find'

class Culler::Root
  include Mongoid::Document

  ### Mongoid Configuration
  store_in :roots
  field :name
  field :path
  field :enabled, :type => Boolean, :default => true

  ### associations and validations
  has_many :files, :class_name => "Culler::File"
  validates_presence_of   :name, :path
  validates_uniqueness_of :name, :path

  ### make the constructor a bit more humane
  def initialize( name, path, opts = {} )
    super opts.merge( :name => name, :path => path )
  end

  ### find files in the root and insert them into the database
  def update
    Find.find( self.path ) do |file|
      next if File.directory?( file )
      f = Culler::File.new( file, :root => self )
      f.save!
    end
  end

  def to_s( level = :normal )
    if level == :detailed
      return "%s: %d files -- %s" % [
        self.name,
        self.files.count,
        self.path
      ]
    else
      return self.name
    end
  end
end
