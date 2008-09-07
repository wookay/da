// NSDistributedNotificationCenterTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSDistributedNotificationCenterTest

- (void) unittest:(id)assert_equal {

  NSDistributedNotificationCenter* center =
    [NSDistributedNotificationCenter defaultCenter];
  [assert_equal _false:[center suspended]];

}

@end
