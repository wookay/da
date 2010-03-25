// HashTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "Hash.h"

@implementation TestSuite (Hash)

- (void) test_Hash {

  NSMutableDictionary* hash = [NSMutableDictionary dictionary];
  assert_equal(@"{}", hash);
  assert_equal(@"", [hash to_s]);

  [hash store:@"b" v:@"B"];
  [hash store:@"a" v:@"A"];
  assert_equal(@"{a = A; b = B; }", hash);
  assert_equal(@"aAbB", [hash to_s]);

  assert_equal(false, [hash empty:'?']);

}

@end
