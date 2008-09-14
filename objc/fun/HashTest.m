// HashTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation HashTest

- (void) unittest {

  NSMutableDictionary* hash = [NSMutableDictionary dictionary];
  [assert_equal a:@"{}" b:hash];
  [assert_equal a:@"" b:[hash to_s]];

  [hash store:@"a" v:@"A"];
  [hash store:@"b" v:@"B"];
  [assert_equal a:@"{a = A; b = B; }" b:hash];
  [assert_equal a:@"aAbB" b:[hash to_s]];

}

@end
