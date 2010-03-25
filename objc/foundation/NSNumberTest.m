// NSNumberTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSNumber)

- (void) test_NSNumber {

  NSNumber* number = [NSNumber numberWithInt:10000000];
  assert_equal(10000000, [number intValue]);
  assert_equal(10000000, number);
  assert_equal(true, [number boolValue]);
  assert_equal(@"10000000", [number stringValue]);

  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setNumberStyle:kCFNumberFormatterDecimalStyle];
  [numberFormatter setGroupingSeparator:@","];
  assert_equal(@",", [numberFormatter groupingSeparator]);
  assert_equal(@"10,000,000", [numberFormatter stringForObjectValue:number]);
  [numberFormatter release];

  assert_equal(0.9f, 1.0f - 0.1f);
  assert_equal(1.2f, [NSNumber numberWithFloat:1.2f]);

}

@end
