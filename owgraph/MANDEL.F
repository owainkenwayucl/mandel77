c     Mandelbrot program
      program mandel

        implicit none
        include 'graphapi.fi'
        include 'graph.fi'

        real xmax, xmin, ymax, ymin, rmax, x0, y0, x, y, xt
        integer xres, yres, max_iter, iter, px, py 
        integer*2 colour

        write(*,'(A)') ' '
        write(*,'(A)') 'Mandelbrot Generator'
        write(*,'(A)') '===================='
        write(*,'(A)') ' '

        write(*,77) 'Xmax [1.0]: '
        call getdefaultreal(1.0, xmax)
        write(*,77) 'Xmin [-2.0]: '
        call getdefaultreal(-2.0, xmin)

        write(*,77) 'Ymax [1.0]: '
        call getdefaultreal(1.0, ymax)
        write(*,77) 'Ymin [-1.0]: '
        call getdefaultreal(-1.0, ymin)

c       DOS VGA
        xres = 640
        yres = 480

        write(*,77) 'Iterations [256]: '
        call getdefaultint(256, max_iter)

77      format(A,$)
        rmax = 4.0
        call _setvideomode(_VRES256COLOR)

        do px = 1, xres
          x0 = ((real(px)/real(xres))*real(xmax-xmin))+xmin

          do py = 1, yres
           y0 = ((real(py)/real(yres))*real(ymax-ymin))+ymin
 
           iter = 0
           x = 0.0
           y = 0.0 

           do while(((x*x)+(y*y).lt.rmax).and.(iter.lt.max_iter))
             xt=(x*x)-(y*y)+x0
             y=2.0*x*y+y0
             x=xt
             iter=iter+1
           enddo
           colour = int((real(iter)/real(max_iter)) * 256)
           
           call _setcolor(colour)
           call _setpixel(px-1, (yres-py)-1)
          enddo
        enddo
        pause
        call _setvideomode(_DEFAULTMODE)
        
      end

      subroutine getdefaultint(def, res) 
        implicit none
        character instr*16
        integer def, res, ioerr

        read(*,'(A)') instr
        read(instr,*,IOSTAT=ioerr) res
        if (ioerr .ne. 0) res=def
      end

      subroutine getdefaultreal(def, res) 
        implicit none
        character instr*16
        real def, res
        integer ioerr

        read(*,'(A)') instr
        read(instr,*,IOSTAT=ioerr) res
        if (ioerr .ne. 0) res=def
      end
