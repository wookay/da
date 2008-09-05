// NSDataTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSDataTest

- (void) unittest:(id)assert_equal {

  NSData* data = [NSData data];
  [assert_equal a:@"<>" b:data];

}

@end
