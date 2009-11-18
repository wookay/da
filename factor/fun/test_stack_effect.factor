USING: kernel tools.test math prettyprint assocs math.order ;
USING: kernel strings sequences math math.parser
hashtables bert byte-arrays io.binary io.encodings.utf8 io.encodings.string
words.symbol accessors combinators fry lists ;
IN: test_stack_effect

: stack_effect ( -- ? ? <=> m n quot assoc str x y z loc dim )
 t f
 +lt+ 
 1 2
 [ ]
 H{ }
 "abc"
 1 2 3
 { 0 0 }
 { 50 50 } ;

[ t f +lt+ 1 2 [ ] H{ } "abc" 1 2 3 { 0 0 } { 50 50 } ]
[ stack_effect ] unit-test
