class Culler::Root
  include Mongoid::Document

  ### Mongoid Configuration
  store_in :roots
  field :name
  field :path
  field :enabled, :type => Boolean, :default => true

  ### associations and validations
  validates_presence_of   :name, :path
  validates_uniqueness_of :name, :path

  ### make the constructor a bit more humane
  def initialize( name, path, opts = {} )
    super opts.merge( :name => name, :path => path )
  end
end
