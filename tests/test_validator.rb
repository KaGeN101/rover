require_relative '../validator'
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  include RoverData
  

  def test_instructions_is_consistent
    data = ["3 3", "0 0 N", "MMMRMMMLMMM"]
    assert_equal(true, is_consistent?(data)) 
  end

  def test_instrucitons_is_consistent_1
    data = ["3 3", "0 0 N", "MMMabcLMMM"]
    assert_equal(true, is_consistent?(data)) 
  end	

  def test_instrucitons_empty
    assert_raise(RuntimeError) do
      is_consistent? nil
    end 
  end
  
  def test_instructions_is_not_conisten_length
    data = ["0 0", "MMMLMMM"]
    assert_equal(false, is_consistent?(data))    
  end

  def test_instrucitons_is_not_consistent_format
    data = ["3 3", "0 0 N", "abc"]
    assert_equal(false, is_consistent?(data)) 
  end	  
 
  def test_instrucitons_is_not_consistent_format_1
    data = ["3 3", "0 0N", "MMMLMMMRMMM"]
    assert_equal(false, is_consistent?(data)) 
  end	  
 
  def test_instrucitons_is_not_consistent_format_2
    data = ["33", "0 0 N", "MMMLMMMRMMM"]
    assert_equal(false, is_consistent?(data)) 
  end	  
 



end
