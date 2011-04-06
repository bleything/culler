require 'test/helper'

class TestCullerRoot < MiniTest::Unit::TestCase
  def setup
    @name = 'my root'
    @path = File.join( File.dirname(__FILE__), '..' )
  end

  def teardown
    Culler::Root.delete_all
    Culler::File.delete_all
  end

  def test_initializer_takes_a_name_and_path
    Culler::Root.new( @name, @path ).save
    assert_equal @name, Culler::Root.first.name
    assert_equal @path, Culler::Root.first.path
  end

  def test_default_to_enabled
    Culler::Root.new( @name, @path ).save
    assert Culler::Root.first.enabled, "root should be enabled"
  end

  def test_can_be_added_as_disabled
    Culler::Root.new( 'disabled', @path, :enabled => false ).save
    refute Culler::Root.first.enabled, "root should be disabled"
  end

  def test_normal_args_override_options_hash
    Culler::Root.new( @name, @path, :name => 'bogus', :path => 'bogus' ).save
    assert_equal @name, Culler::Root.first.name
    assert_equal @path, Culler::Root.first.path
  end

  def test_invalid_without_unique_name
    Culler::Root.new( @name, @path ).save
    refute Culler::Root.new( @name, 'some other path' ).valid?
  end

  def test_invalid_without_unique_path
    Culler::Root.new( @name, @path ).save
    refute Culler::Root.new( 'some other name', @path ).valid?
  end

  def test_update_inserts_files
    files = []
    Find.find( @path ) {|f| files << f }
    files.delete_if {|f| File.directory? f }

    root = Culler::Root.new( @name, @path )
    root.update

    assert_equal files.count, Culler::File.count
  end

  def test_update_only_adds_files
    root = Culler::Root.new( @name, @path )
    root.update

    Culler::File.all.each do |f|
      assert File.file?( f.path )
    end
  end
end
