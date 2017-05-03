module RoverData

  def is_consistent? instructions
    raise "Instructions cannot be nil" unless instructions
    # Checks the instructions and returns it if valid
    # Will print error and fall to nil if not valid returning false in essence  
    if instructions.length == 3
      return instructions	    
    else
      puts "Instrucitons set does nto have the correct length"      
    end      	    
  end  

end	
