require_relative '../engine'
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  include Engine
  

  def test_start_engine
    data = ["3 3", "1 1 N", "MMRMRMMLMLMM"]	  
    assert_equal([1, 1], start(data).location)
    assert_equal('N', start(data).direction) 
  end

  def test_drive
    data = ["3 3", "1 1 N", "MMRMRMMLMLMM"]	  
    assert_equal([3, 3], drive(start(data, false), data[2], false)) 
  end

  def test_drive_out_of_bounds
    data = ["3 3", "1 1 N", "MMMRMMMLMMM"]	  
    assert_equal([3, 3], drive(start(data, false), data[2], false)) 
  end  
end
