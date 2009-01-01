// TestFriends.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestFriends

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id friends;

  friends = [me2day get_friends:@"dahlia"];
  if (LOCAL_TEST) {
    friends = fixture(@"friends.json");
  }
  [assert_equal a:@"dahlia" b:[friends friendsOf]];
  [assert_equal int:518 int:[[friends friends] count]];

  [me2day release];

}

@end
