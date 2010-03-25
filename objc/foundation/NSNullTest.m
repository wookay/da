// NSNullTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSNull)

- (void) test_NSNull {

  NSNull* null = [NSNull null];
  assert_equal(@"<null>", null.inspect);
  assert_equal([NSNull null], null);

}

@end
