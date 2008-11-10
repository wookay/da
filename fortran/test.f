c     test.f
c                           wookay.noh at gmail.com
c                           http://wookay.egloos.com

      SUBROUTINE assert_equal(expected, got)
        if (expected .EQ. got) then
          print *, "passed: ", expected
        else
          print *, "Assertion failed"
          print *, "Expected: ", expected
          print *, "Got: ", got
        end if
      END

      PROGRAM main
        call assert_equal( 1.0 , 1.0       )
        call assert_equal( 3.0 , 1.0 + 2.0 )
      END
