// NSErrorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSErrorTest

- (void) unittest {

  NSError* error = [NSError errorWithDomain:@"domain"
                            code:0
                            userInfo:nil];
  [assert_equal a:@"domain" b:[error domain]];

}

@end
