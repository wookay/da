// TestNoop.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestNoop

- (void) unittest {

  id me2day = [[Me2day alloc] username:USERNAME userkey:USERKEY];
  id response = [me2day requestAuth:@"noop"];
  if (response) {
    [assert_equal a:@"0" b:[response valueForKey:@"code"]];
    [assert_equal a:@"성공했습니다." b:[response valueForKey:@"message"]];
  }

  [me2day release];
}

@end
