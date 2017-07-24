c     Mandelbrot program
      program mandel

        implicit none

        real xmax, xmin, ymax, ymin, rmax, x0, y0, x, y, xt
        integer xres, yres, max_iter, iter, px, py, m

        parameter (m = 1000000)

        character fname*1024, arr(m)

        fname = 'mandel.pbm'

        call cuarr(arr, m)

        xmax = 2
        xmin = -2.0
  
        ymax = 1.0
        ymin = -1.0

c       DOS console size - frame
        xres = 78
        yres = 42

        max_iter = 256

        rmax = 2.0

        do px = 1, xres
          x0 = ((real(px)/real(xres))*real(xmax-xmin))+xmin

          do py = 1, yres
           y0 = ((real(py)/real(yres))*real(ymax-ymin))+ymin
 
           iter = 0
           x = 0.0
           y = 0.0 

           do while(((x*x)+(y*y).lt.(rmax*rmax)).and.(iter.lt.max_iter))
             xt=(x*x)-(y*y)+x0
             y=2.0*x*y+y0
             x=xt
             iter=iter+1
           enddo
           if ((max_iter-iter).gt.0) then
             call set(arr, m, xres, yres, px, py, 1)
           endif

          enddo
        enddo

        call writepbm(arr,m,xres,yres,fname)
        call pr2box(arr,m,xres,yres)
      end
