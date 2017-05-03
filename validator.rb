module RoverData

  def is_consistent? instructions
    raise "Instructions cannot be nil" unless instructions
    # Checks the instructions and returns it if valid
    # Will print error and fall to nil if not valid returning false in essence  
    if instructions.length == 3
      # Use regualar expression to test the formats in order	     
      if instructions[0] =~ /\d\s\d/	    
	if instructions[1] =~ /\d\s\d\s[N|E|S|W]/
	  # This will match any combinaitons of valid more commands as long as they are there first 
	  # and can be mixed with garbage will filter out the valid   	
	  if instructions[2] =~ /(M|L|R)+/ 
            return instructions
          else
            puts "Invalid move commad set, must be combinations of M|L|R"		  
	  end
	else
	  puts "Initial postion and direction not in the right format, must be 'x y N|E|S|W'"
	end  
      else
        puts "Grid size not in the right format must be 'x y'"	
      end	
    else
      puts "Instructions set does nto have the correct length"      
    end      	    
  end  

end	
