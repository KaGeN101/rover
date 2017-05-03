
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
 - -l       Verbose, the default for this is true

The program will respond with and error state or the final location on success. It will be verbose by default. 
This cann be disabled if you just want to run through the program as fast as possible.
If you want to switch of verbosity simply pass the -l option false. This will make the program run an non pausing speed and just show the result
`ruby rover.rb PATH_TO_INSTRUCTION_SET -l=false`

### Design
 - The Rover checks if a file is received and instructions
 - It then send the data received for validation. This insures that all logic after this acts on contractually sound data
 - If that passes if send the instruction set to the Engine
 - The Engine configures starts at the initial location on the Terrain
 - It then begins to excute its instructions an drive the set one command at a time

Since you only need to know where you end up there is no need to move in a datastructure, like a 2d array. One can just move across the rows and columns
depending on you direction.
Also the direction is done with switching so you dont have to have logic that knows what comes after a certain directional point. You can switch directions
up or down depending on if you need to go Left or Right.

In general terms E and W moves forward and backward in columns, and North and South forward and backwars in rows.

TODO:
The rover will never go outside of it defined zone, if commands want to go over a boundary the rover will not move beyond the boundary and will ignore that command.
It then try the next command and either move back or along the boundary. If you keep making commands beyomnd the boundary direcion,
it will most probably just get stuck in a conner eventaully and never go beyond that point. 
This is and ultimate failsafe even if you keep sending commands to it.

### Testing
Each funtion has a has a unit test in the tests folder.
Most of the modules where coded in a TDD fashion to make it fun. But the order of this is immeterial, as long as all the test run before the coding is done. 
To run the tests simpy go:


I have also aadded a functional in in test_instructions.bla. The output of this should be [3, 3]
 
