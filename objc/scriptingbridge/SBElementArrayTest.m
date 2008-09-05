// SBElementArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation SBElementArrayTest

- (void) unittest:(id)assert_equal {

  SBElementArray* ary = [SBElementArray alloc];
  [assert_equal a:@"()" b:ary];

}

@end
