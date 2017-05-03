
class Terrian
   
  attr_reader :rows, :cols, :current_row, :current_col, :direction 

  # Don't think you need a datastructure to track where you are you can just move on the plane	
  def initialize grid_size, initial
    @rows, @cols = grid_size.split('_').collect {|i| i.to_i}
    split = initial.split(' ')
    @current_row = split[0].to_i
    @current_col = split[1].to_i
    @direction = split[2]
    @direction_switch = ['N', 'E', 'S', 'W']
    @direction_index = @direction_switch.index @direction
  end

  def execute command
    if command == 'M'
      case @direction
        when 'N'
          @current_row += 1
	  #if @current_row == @rows
          #  @current_row -= 1
	  #end  
	when 'E'
	  @current_col += 1
	  #if @curent_col == @cols
	  #  @current_col -= 1
          #end	    	  
        when 'S'
          @current_row -= 1
	  #if @current_row == -1
          #  @current_row = 0
          #end	    
        when 'W'
          @current_col -= 1
          #if @current_col == -1
	  #  @current_col = 0
          #end	    
      end	   	  
    else
      if command == 'R'
        @direction_index += 1
	if @direction_index == @direction_switch.length
          @direction_index = 0
        end
        @direction = @direction_switch[@direction_index]	
      end
      if command == 'L'
        @direction_index -= 1
        if @direction_index == -1
	  @drection_index = @direction_switch.length - 1
        end
        @direction = @direction_switch[@direction_index]	
      end	      
    end
  end	  

  def location
    [@current_row, @current_col]
  end    

end

# North and South changes rows
# East and West changes colounms 


module Engine
 
  def start instructions, verbose=true
    engine = Terrian.new(instructions[0], instructions[1])
    puts "Engine started at location:#{engine.location}" unless !verbose
    engine
  end

  def drive engine, commands, verbose=true
    commands.split('').each do |command|
      puts "Executing instruction: #{command}" unless !verbose
      engine.execute command
      if verbose
        puts "Rover is now at location: #{engine.location} #{engine.direction}"
        sleep 1.5
      end	
    end
    engine.location    
  end 	  

end

