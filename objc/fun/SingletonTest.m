// SingletonTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "Singleton.h"

@implementation SingletonTest

- (void) unittest {

  Singleton* singletonA = [Singleton sharedMethod];
  Singleton* singletonB = [Singleton sharedMethod];
  assert_equal(singletonA, singletonB);

}

@end
