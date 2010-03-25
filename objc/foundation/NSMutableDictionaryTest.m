// NSMutableDictionaryTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSMutableDictionary)

- (void) test_NSMutableDictionary {

  NSMutableDictionary* hash = [NSMutableDictionary dictionary];
  assert_equal(@"{}", [hash inspect]);

  assert_equal(nil, [hash valueForKey:@"key"]);

  [hash setObject:@"value" forKey:@"key"];
  assert_equal(@"{key = value}", hash.inspect);

  [hash setObject:@"value2" forKey:@"key2"];
  assert_equal(@"{key = value, key2 = value2}", hash.inspect);
  assert_equal(@"value2", [hash valueForKey:@"key2"]);

  for(id key in hash) {
    assert_equal(true, [[hash allKeys] containsObject:key]);
  }
 
}

@end
