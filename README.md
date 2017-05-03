
## Rover

### Introduction
This is a simple terrain walker in the form of a rover on Mars. It comes in many formats the earliest being Logo.
It has a variation where there is a a map with terrain markers and parts you cannot walk on.
Since there was no functional language options on the list and due to Ruby's morphability,
I decided to write it in a pure Functional Ruby format.
This problem can easily be modeled in an OO methodoly but thought it would be more fun in a functional specification.

### Operational
To run the program simply do:
`ruby rover.rb PATH_TO_INSTRUCTION_SET`
OPTIONS: 
 - -d       Display, the default for this is false
 - -l       Verbose, the default for this is true

The program will respond with and error state or the final location on success. It will be verbose by default. 
This cann be disabled if you just want to run through the program as fast as possible.
You can optional print the path by passing in a second command as true
`ruby rover.rb PATH_TO_INSTRUCTION_SET -d=true`

If you want to switch of verbosity simply pass the -l option false. This will make the program run an non pausing speed and just show the result
`ruby rover.rb PATH_TO_INSTRUCTION_SET -l=false`

Options can also be passed together:
`ruby rover.rb PATH_TO_INSTRUCTION_SET -d=true -l=false`

### Design
 - The Rover checks if a file is received and with instructions
 - It then send the data recived for validation
 - If that passes if send the instruction set to the Engine
 - The Engine configures in Oreintation on the Terrain
 - It then begins to excute its instructions an drive the set one command at a time

### Testing
Each funtion has a has a unit test in the tests folder.
Most of the modules where coded in a TDD fashion to make it fun. But the order of this is immeterial, as long as there 
To run the tests simpy go:

 
