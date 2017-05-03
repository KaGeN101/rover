

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
  File.open(ARGV[0], 'r') {|f| instrucitons = readlines}
else
  usage	
end

