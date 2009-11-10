USING: tools.test words ;
IN: test_word

[ t ] [ \ word word? ] unit-test
[ t ] [ \ [ word? ] unit-test
[ t ] [ \ word? word? ] unit-test
[ t ] [ \ IN: word? ] unit-test
[ t ] [ \ t word? ] unit-test
[ t ] [ \ f word? ] unit-test

[ f ] [ "a" word? ] unit-test
[ f ] [ [ ] word? ] unit-test
