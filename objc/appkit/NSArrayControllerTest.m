// NSArrayControllerTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSArrayControllerTest

- (void) unittest:(id)assert_equal {

  NSArrayController* controller = [NSArrayController alloc];
  [assert_equal bool:false bool:[controller canInsert]];

}

@end
