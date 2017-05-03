require_relative '../engine'
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  include Engine
  

  def test_start_engine
    data = ["3 3", "0 0 N", "MMRMRMMLMLMM"]	  
    assert_equal([0, 0], start(data).location)
    assert_equal('N', start(data).direction) 
  end

  def test_drive
    data = ["3 3", "0 0 N", "MMRMRMMLMLMM"]	  
    assert_equal([2, 2], drive(start(data), data[2])) 
  end

  def test_drive_out_of_bounds
    data = ["3 3", "0 0 N", "MMMRMMMLMMM"]	  
    assert_equal([3, 3], drive(start(data), data[2])) 
  end  
end
