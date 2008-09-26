// NumericTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NumericTest

- (void) unittest {

  NSNumber* one = [NSNumber numberWithInt:1];
  NSNumber* six = [NSNumber numberWithFloat:1.6f];

  [assert_equal int:1 int:[one to_i]];
  [assert_equal int:1 int:[six to_i]];

  [assert_equal float:1 float:[one to_f]];
  [assert_equal float:1.6f float:[six to_f]];

  [assert_equal a:@"1.6" b:[six to_s]];
  [assert_equal float:1.6f float:[[six to_s] to_f]];
  
  int idx;
  for (idx = 0; idx < 1; idx++) {
    int rand = arc4random() % 100;
    [assert_equal _true:0 <= rand && 100 > rand];
  }

}

@end
