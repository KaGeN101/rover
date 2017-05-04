require_relative 'validator'
require_relative 'engine'

include RoverData
include Engine

verbose=true
display=false

def usage
  puts "USAGE: ruby rover.rb PATH_TO_INSTRUCTIONS"
  puts "OPTIONS:"
  puts "-l    Verbosity"
  exit  
end

# Check and use ARGS
if ARGV.length == 0
  usage
else
  # Check if any options where passed 
  if ARGV.length > 1
    if ARGV[1].include? '-l='
      state = ARGV[1].split('=')[1]
      if state == false.to_s
        verbose = false
      end
    end      
  end
end  

# Get the instructions
instructions = nil
if File.exist? ARGV[0]
  File.open(ARGV[0], 'r') {|f| instructions = f.readlines}
else
  usage	
end

# Go go go ...
if is_consistent? instructions
  puts "Rover received well formed instuctions from Command Centre! Starting Engine ..." unless !verbose
  engine = start(instructions, verbose)
  drive(engine, instructions[2], verbose)
  puts "########################"  
  puts "# Ended up at #{engine.location} #{engine.direction} #"
  puts "########################"
end	

