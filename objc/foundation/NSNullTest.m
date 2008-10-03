// NSNullTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSNullTest

- (void) unittest {

  NSNull* null = [NSNull null];
  [assert_equal a:@"<null>" b:null];
  [assert_equal a:[NSNull null] b:null];

}

@end
