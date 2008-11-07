#!/bin/sh
## test.scala
##                          wookay.noh at gmail.com
##                          http://wookay.egloos.com

!#
def assert_equal(expected:Int, got:Int) {
  expected==got match {
    case true =>
      println("passed: " + expected)
    case _ =>
      println("Assertion failed\nExpected: " + expected + "\nGot: " + got)
  }
}

assert_equal( 1 , 1   )
assert_equal( 3 , 1+2 )
