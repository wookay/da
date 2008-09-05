// NSMutableDictionaryTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableDictionaryTest

- (void) unittest:(id)assert_equal {

  NSMutableDictionary* hash = [NSMutableDictionary dictionary];
  [assert_equal a:@"{}" b:hash];

  [hash setObject:@"value" forKey:@"key"];
  [assert_equal a:@"{key = value; }" b:hash];

  [hash setObject:@"value2" forKey:@"key2"];
  [assert_equal a:@"{key = value; key2 = value2; }" b:hash];
  [assert_equal a:@"value2" b:[hash valueForKey:@"key2"]];
 
}

@end
