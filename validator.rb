module RoverData

  # Validates that the instructions matches the specifications
  # The contract being inforced here means all other code can just operate on well formed specfication	
  def is_consistent? instructions
    raise "Instructions cannot be nil" unless instructions
    length?(instructions) && grid_size?(instructions[0]) && origin?(instructions[1]) && commands?(instructions[2])
  end  

  private 

  def length? instructions
     instructions.length == 3 	  
  end

  def grid_size? grid	  
    (grid =~ /\d\s\d/) != nil
  end
 
  def origin? location
    (location =~ /\d\s\d\s[N|E|S|W]/) != nil
  end
  
  def commands? set
    (set =~ /(M|L|R)+/) != nil 
  end	  
end	
