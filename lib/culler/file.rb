class Culler::File
  include MongoMapper::Document

  ### Mongoid Configuration
  set_collection_name :files
  key :path, String

  ### associations and validations
  belongs_to :root, :class_name => 'Culler::Root'
  validates_presence_of   :path
  validates_uniqueness_of :path
  validates_presence_of   :root_id,
    :message => "is required"

  ### make the constructor a bit more humane
  def initialize( path, opts = {} )
    super opts.merge( :path => path )
  end
end
