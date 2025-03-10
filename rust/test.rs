// test.rs
//                             wookay.noh at gmail.com

use std::cmp::Eq ;
use std::fmt::Display ;

fn assert_equal<T>(expected: T, got: T)
where T: Eq + Display
{
    if expected == got {
        print!("passed: {}\n", expected);
    } else {
        print!("Assertion failed\nExpected: {}\nGot: {}\n", expected, got);
    }
}

fn main() {
    assert_equal(1, 1);
    assert_equal(3, 1+2);
    assert_equal("a", "a");
    assert_equal(true, 1==1);
    let one = 1./3. + 1./3. + 1./3.;
    assert_equal(true, one == 1.);
}
