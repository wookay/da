// NSDataTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSData)

- (void) test_NSData {

  NSData* data = [NSData data];
  assert_equal(@"<>", [data inspect]);

  data = [@"a" dataUsingEncoding:NSUTF8StringEncoding]; 
  assert_equal(@"<61>", data.inspect);

}

@end
