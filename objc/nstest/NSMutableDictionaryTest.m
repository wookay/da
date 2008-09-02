// NSMutableDictionaryTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableDictionaryTest

- (void) unittest:(id)assert_equal {

  NSMutableDictionary* hash = [NSMutableDictionary dictionary];
  [assert_equal a:@"{}" b:hash];

  [hash setObject:@"value" forKey:@"key"];
  [assert_equal a:@"{key = value; }" b:hash];
 
}

@end
