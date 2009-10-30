-- test.e
--                            wookay.noh at gmail.com

class TEST
creation {ANY}
  main
feature {ANY}

  assert_equal(expected, got: INTEGER) is
  require
    expected > 0
    got > 0
  do
    if expected = got then
      io.put_string("passed: ")
      io.put_integer(expected)
      io.put_new_line
    else
      io.put_string("Assertion failed%NExpected: ")
      io.put_integer(expected)
      io.put_string("%NGot: ")
      io.put_integer(got)
      io.put_new_line
    end    
  end

  main is
  do
    assert_equal( 1 , 1   )
    assert_equal( 3 , 1+2 )
  end
end
