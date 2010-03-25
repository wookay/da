USING: tools.test csv io.streams.string ;
IN: test_csv

[ { { "1" "2" "3" } } ] [ "1,2,3" <string-reader> csv ] unit-test
