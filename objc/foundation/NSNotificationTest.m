// NSNotificationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSNotification)

- (void) test_NSNotification {

  NSNotification* noti = [NSNotification notificationWithName:@"name" object:@"object"];
  assert_equal(@"name", [noti name]);
  assert_equal(@"object", [noti object]);

}

@end
