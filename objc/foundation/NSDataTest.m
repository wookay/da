// NSDataTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSDataTest

- (void) unittest {

  NSData* data = [NSData data];
  [assert_equal a:@"<>" b:data];

  data = [@"a" dataUsingEncoding:NSUTF8StringEncoding]; 
  [assert_equal a:@"<61>" b:data];

}

@end
