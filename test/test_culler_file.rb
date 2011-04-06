require 'test/helper'

class TestCullerFile < MiniTest::Unit::TestCase
  def setup
    @path = '/tmp/some_file.bin'
    @root = Culler::Root.new( "tmp", "/tmp" )
  end

  def teardown
    Culler::File.delete_all
  end

  def test_invalid_without_root
    c = Culler::File.new( @path )
    refute c.valid?
  end

  def test_invalid_without_unique_path
    Culler::File.new( @path, :root => @root ).save
    refute Culler::File.new( @path, :root => @root ).valid?
  end

  def test_initializer_takes_a_name_and_path
    Culler::File.new( @path, :root => @root ).save
    assert_equal @path, Culler::File.first.path
  end

  def test_normal_args_override_options_hash
    Culler::File.new( @path, :root => @root, :path => 'bogus' ).save
    assert_equal @path, Culler::File.first.path
  end
end
