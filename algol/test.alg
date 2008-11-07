begin
  comment test.alg
                             wookay.noh at gmail.com
                             http://wookay.egloos.com ;

  procedure assertEqual(expected, got);
    integer expected; integer got;
    begin
      if expected = got then begin
        outstring(1, "passed: ");
        outinteger(1, expected);
        outstring(1, "\n")
      end else begin
        outstring(1, "Assertion failed\nExpected: ");
        outinteger(1, expected);
        outstring(1, "\nGot: ");
        outinteger(1, got);
        outstring(1, "\n")
      end
    end;

  assertEqual( 1 , 1   );
  assertEqual( 3 , 1+2 )

end
