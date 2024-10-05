### MINT 2.0

V2

```

```

```
V1



// Constants
#1A84 x1 ! #E67C x2 ! // -39000 and 39000 scaled by 1000
#D120 y1 ! #2EE0 y2 ! // -12000 and 12000 scaled by 1000
#3E8 s !              // Step size 1000
#9C40 l !             // Loop limit 40000

// Variables
0 a ! 0 b ! 0 i !     // Initialize a, b, and iteration counter

// Helper functions
:S " * s / ;          // Scale and divide
:M " S $  S + ;       // Multiply and add scaled

// Iterate function
:I
  a a M b b M - x S + // New a = a^2 - b^2 + x
  a b M M y S +       // New b = 2ab + y
  b ! a !             // Store new a and b
;

// Main Mandelbrot function
:M
  y1 y2 s (           // Y loop
    /N                // New line
    x1 x2 s (         // X loop
      0 a ! 0 b !     // Reset a and b
      0 i !           // Reset iteration counter
      /U (            // Start unlimited loop
        I             // Call iterate function
        a a M b b M + // Calculate magnitude
        l > i #A > |  // Check exit condition
        /W            // Continue while condition is false
        i 1 + i !     // Increment counter
      )
      i #30 + /C      // Print ASCII character
    )
  )
;

// Run the Mandelbrot program
M

```
