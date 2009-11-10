USING: tools.test words.symbol alien.strings accessors eval ;
IN: test_symbol

SYMBOL: foo

[ t ] [ foo symbol? ] unit-test
[ foo ] [ foo ] unit-test

"IN: test_symbol SYMBOL: bar " eval( -- )
DEFER: bar
[ bar ] [ bar ] unit-test
