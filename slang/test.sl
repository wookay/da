% test.sl
%                           wookay.noh at gmail.com

define assert_equal(expected, got) { 
  if (expected==got) {
    printf("passed: %S\n", expected);
  } else {
    printf("Assertion failed\nExpected: %S\nGot: %S\n", expected, got);
  }
}

assert_equal( 1            , 1                  );
assert_equal( 3            , 1+2                );
assert_equal( "a"          , "a"                );
assert_equal( Integer_Type , typeof(1)          );
assert_equal( String_Type  , typeof("")         );
assert_equal( Double_Type  , typeof(1.1)        );
assert_equal( List_Type    , typeof({})         );
assert_equal( Struct_Type  , typeof(struct {a}) );
assert_equal( 7            , eval("1+2*3")      );
