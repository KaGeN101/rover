require_relative '../validator'
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  include RoverData
  

  def test_instructions_is_consistent
    data = ["3 3", "0 0 N", "MMMRMMMLMMM"]
    assert_equal(data, is_consistent?(data)) 
  end

  def test_instrucitons_empty
    assert_raise(RuntimeError) do
      is_consistent? nil
    end  
	    
  end
  
  def test_instructions_is_not_conisten_length
  end

  def test_instrucitons_is_not_consistent_format
  end	  
 
end
