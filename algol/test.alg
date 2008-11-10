begin
  comment test.alg
                             wookay.noh at gmail.com
                             http://wookay.egloos.com ;

  procedure assertEqual(expected, got);
  integer expected, got;
  begin
    integer stdout;
    stdout := 1;
    if expected=got then begin
      outstring(stdout, "passed: ");
      outinteger(stdout, expected);
      outstring(stdout, "\n")
    end else begin
      outstring(stdout, "Assertion failed\nExpected: ");
      outinteger(stdout, expected);
      outstring(stdout, "\nGot: ");
      outinteger(stdout, got);
      outstring(stdout, "\n")
    end
  end;

  assertEqual( 1 , 1   );
  assertEqual( 3 , 1+2 )

end
