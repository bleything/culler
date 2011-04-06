require 'test/helper'

class TestCuller < MiniTest::Unit::TestCase
  def test_defines_a_version
    assert_includes Culler.constants, :VERSION
  end
end
