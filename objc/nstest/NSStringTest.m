// NSStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSStringTest

- (void) unittest:(id)assert_equal {

  NSString* string = [NSString stringWithFormat:@"%d", 200];
  [assert_equal a:@"200" b:string];

}

@end
