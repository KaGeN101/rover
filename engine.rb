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

  private

  # This is the terrain movement model. This encapsulates the movement on the plane
  # This is the only port that is not done functional and has a state on instantiation
  # It is private to this module so from an access perspective the Engine module is just two functions
  class Terrian
  
    attr_reader :direction

    # Don't think you need a datastructure to track where you are you can just move on the plane	
    def initialize grid_size, initial
      @rows, @cols = grid_size.split(' ').collect {|i| i.to_i}
      split = initial.split(' ')
      @current_col = split[0].to_i
      @current_row = split[1].to_i
      @direction = split[2]
      @direction_switch = ['N', 'E', 'S', 'W']
      @direction_index = @direction_switch.index @direction
    end

    def location
      [@current_col, @current_row]
    end   

    def execute command
      if command == 'M'	    
        return move
      end	
      turn(command)
    end

    private

    def move
      move_n unless @direction != 'N'
      move_e unless @direction != 'E'
      move_s unless @direction != 'S'
      move_w unless @direction != 'W'      
    end

    def move_n
      @current_row += 1	    
      @current_row = check_boundary @current_row, '>', @rows	    
    end
    def move_e
      @current_col += 1
      @current_col = check_boundary @current_col, '>', @cols      
    end
    def move_s
      @current_row -= 1
      @current_row = check_boundary @current_row, '<', 1       
    end
    def move_w
      @current_col -= 1
      @current_col = check_boundary @current_col, '<', 1      
    end	    

    def check_boundary lhs, op, rhs
      if lhs.send(op, rhs)
        return rhs
      end
      return lhs      
    end	    
  
    def turn command
      turn_r unless command != 'R'
      turn_l unless command != 'L'
    end	    

    def turn_r
      @direction_index += 1
      if @direction_index == @direction_switch.length
        @direction_index = 0
      end
      @direction = @direction_switch[@direction_index]      
    end	    
    
    def turn_l
      @direction_index -= 1
      if @direction_index == -1
	@drection_index = @direction_switch.length - 1
      end
      @direction = @direction_switch[@direction_index]    
    end

  end  

end

