; https://www.programiz.com/c-programming/online-compiler/


#include <stdio.h>
#include <complex.h>

#define MAX_ITERATIONS 500

int main()
{
    int width = 80;
    int height = 25;
    double xmin = -2;
    double xmax = 1;
    double ymin = -1.5;
    double ymax = 1.5;
    double x, y;
    double complex z, c;
    int iterations;
    int i, j;

    for (i = 0; i < height; i++) {
        y = ymin + (ymax - ymin) * i / height;
        for (j = 0; j < width; j++) {
            x = xmin + (xmax - xmin) * j / width;
            z = 0 + 0 * I;
            c = x + y * I;
            iterations = 0;

            while (iterations < MAX_ITERATIONS && cabs(z) < 2) {
                z = z * z + c;
                iterations++;
            }

            if (iterations == MAX_ITERATIONS)
                printf("*");
            else
                printf(" ");
        }
        printf("\n");
    }
    return 0;
}
