# mandel77
Mandelbrot in F77 for FreeDOS

This repo just contains a quick Mandelbrot implementation based on stuff I wrote for [Conway's Game of Life on DOS](https://github.com/owainkenwayucl/fortlife).

You probably shouldn't use this as it's pretty bad, I'm just putting it into GitHub for safekeeping.

You need to install the OpenWatcom F77 Compiler onto DOS to compile this code.

To build:

```none
C:\HOME\SOURCE\MANDEL77>wmake /c
```

To run:

```none
C:\HOME\SOURCE\MANDEL77>mandel
```

It will run and display an extremely low resolution mandelbrot image, and also write it to `mandel.pbm`.

![Photo of code running on DOS](https://pbs.twimg.com/media/DDLFhovXsAEfgoS.jpg)
