// NSAttributedStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSAttributedStringTest

- (void) unittest:(id)assert_equal {

  NSAttributedString* s = @"test";
  [assert_equal int:4 int:[s length]];

}

@end
