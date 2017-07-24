# Mandelbrot Generator with OW Fortran Graphics Library.

## Compilation

Edit `makefile` so that `$GINC` points to the location of your OpenWatcom Fortran include files, then run `wmake`.

## Running

Run `mandel.exe`.  You'll be asked some question about the values of X, Y and number of interations and then the Mandelbrot set will be generated and plotted.

![Render with the default values](https://pbs.twimg.com/media/DFSHNYpXUAAD1vg.jpg)

This program will not work if your graphics adaptor does not support 640x480 in 256 colours.
