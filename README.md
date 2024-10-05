 
### Mandelbrot for TEC-1 8x8 Matrix
explanations:

1. Removed the use of IX and IY registers, replacing them with regular memory accesses to `x` and `y` variables.
2. Modified the main loop to use these memory variables instead of the index registers.
3. Adjusted the `calculate_mandelbrot` function to work with the memory variables instead of passed-in register values.
4. Kept the overall logic of the Mandelbrot set calculation the same, just changing how we access and update the x and y coordinates.
5. Ensured all instructions are valid Z80 assembly instructions.

This version should now be fully compatible with the Z80 instruction set and work correctly on the TEC-1 with the 8x8 LED matrix. The code avoids using any addressing modes that are not supported by the Z80.

To use this program:

1. Load the code into the TEC-1's memory starting at address 0x0000.
2. Start execution at 0x0000.
3. The program will continuously generate and display the Mandelbrot set on the 8x8 LED matrix.

The Mandelbrot set will be displayed as lit LEDs on the matrix, with each LED representing a point in the complex plane. Due to the low resolution, the pattern will be very simplified, but should still be recognizable as a basic Mandelbrot set.

This version should run without any addressing mode errors and provide a basic visualization of the Mandelbrot set on your TEC-1's 8x8 LED matrix, fully compatible with the Z80 processor.


### c code
![image](https://user-images.githubusercontent.com/58069246/205287649-7251a3ef-b013-4e9d-bf3a-3ca4884316db.png)



## Ref
- https://en.wikipedia.org/wiki/Mandelbrot_set
- https://www.onlinegdb.com/online_c_compiler
- https://www.tutorialspoint.com/execute_forth_online.php

