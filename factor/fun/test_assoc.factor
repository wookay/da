USING: kernel tools.test math prettyprint assocs ;
USING: kernel strings sequences math math.parser
hashtables bert byte-arrays io.binary io.encodings.utf8 io.encodings.string
words.symbol accessors combinators fry lists ;
IN: test_assoc

: discount ( prices n -- newprices )
    [ - ] curry assoc-map ;

H{ { "bananas" 5 } { "apples" 42 } { "pears" 17 } } 2 discount .

[ "bananas" "apples" "pears" { 5 42 17 } ]
[ H{ { "bananas" 5 } { "apples" 42 } { "pears" 17 } } [ ] { } assoc>map ] unit-test
