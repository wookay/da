// NumericTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "Numeric.h"

@implementation TestSuite (Numeric)

- (void) test_Numeric {

  NSNumber* one = [NSNumber numberWithInt:1];
  NSNumber* six = [NSNumber numberWithFloat:1.6f];

  assert_equal(1, [one to_i]);
  assert_equal(1, [six to_i]);

  assert_equal(1, [one to_f]);
  assert_equal(1.6f, [six to_f]);

  assert_equal(@"1.6", [six to_s]);
  assert_equal(1.6f, [[six to_s] to_f]);
  
  int idx;
  for (idx = 0; idx < 1; idx++) {
    int rand = arc4random() % 100;
    assert_equal(true, 0 <= rand && 100 > rand);
  }

}

@end
