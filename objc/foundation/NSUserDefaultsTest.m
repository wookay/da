// NSUserDefaultsTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSUserDefaultsTest

- (void) unittest {

  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  NSArray* dogs;
  dogs = [defaults arrayForKey:@"dogs"];
  [assert_equal a:nil b:dogs];

  NSArray* newDogs = [NSArray arrayWithObjects:@"1", @"2", nil];
  [defaults setObject:newDogs forKey:@"dogs"];
  dogs = [defaults arrayForKey:@"dogs"];
  [assert_equal a:@"(1, 2)" b:dogs];

}

@end
