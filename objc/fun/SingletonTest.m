// SingletonTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation SingletonTest

- (void) unittest {

  Singleton* singletonA = [Singleton sharedMethod];
  Singleton* singletonB = [Singleton sharedMethod];
  [assert_equal a:singletonA b:singletonB];

}

@end
