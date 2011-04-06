class Culler::File
  include Mongoid::Document

  ### Mongoid Configuration
  store_in :files
  field :path

  ### associations and validations
  belongs_to :root, :class_name => "Culler::Root"
  validates_presence_of   :path
  validates_uniqueness_of :path
  validates_presence_of   :root_id,
    :message => "cannot be saved without an associated root."

  ### make the constructor a bit more humane
  def initialize( path, opts = {} )
    super opts.merge( :path => path )
  end
end
