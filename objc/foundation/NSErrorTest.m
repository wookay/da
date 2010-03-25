// NSErrorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSError)

- (void) test_NSError {

  NSError* error = [NSError errorWithDomain:@"domain"
                            code:0
                            userInfo:nil];
  assert_equal(@"domain", [error domain]);

}

@end
