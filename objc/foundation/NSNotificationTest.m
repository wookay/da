// NSNotificationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSNotificationTest

- (void) unittest:(id)assert_equal {

  NSNotification* noti = [NSNotification notificationWithName:@"name" object:@"object"];
  [assert_equal a:@"name" b:[noti name]];
  [assert_equal a:@"object" b:[noti object]];

}

@end
