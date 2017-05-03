require_relative 'validator'
require_relative 'engine'

include RoverData
include Engine

verbose=true
display=false

def usage
   puts "USAGE: ruby rover.rb PATH_TO_INSTRUCTIONS"
  puts "OPTIONS:"
  puts "-d    Display"
  puts "-l    Verbosity"
  exit  
end

if ARGV.length == 0
  usage
else
  # Check if any options where passed 
  if ARGV.length > 1
  end
end  

instructions = nil
if File.exist? ARGV[0]
  File.open(ARGV[0], 'r') {|f| instructions = readlines}
else
  usage	
end

if is_consistent? instructions
  puts "Rover received well formed instuctions from Command Centre! Starting Engine ..." unless !verbose
  engine = start(instructions)
  drive(engine, instructions[2])
  if verbose
    puts "########################"  
    puts "# Ended up at #{engine.location} #{engine.direction} #"
    puts "########################"
  end
end	

