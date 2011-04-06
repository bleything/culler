require 'test/helper'

class TestCullerRoot < MiniTest::Unit::TestCase
  def setup
    Culler::Root.delete_all
    @name = 'my root'
    @path = '/tmp'
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
end
