// NSUserDefaultsTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSUserDefaults)

- (void) test_NSUserDefaults {

  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  NSArray* dogs;
  dogs = [defaults arrayForKey:@"dogs"];
  assert_equal(nil, dogs);

  NSArray* newDogs = [NSArray arrayWithObjects:@"1", @"2", nil];
  [defaults setObject:newDogs forKey:@"dogs"];
  dogs = [defaults arrayForKey:@"dogs"];
  assert_equal(@"[1, 2]", dogs.inspect);

}

@end
