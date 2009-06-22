// NSNumberTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSNumberTest

- (void) unittest {

  NSNumber* number = [NSNumber numberWithInt:10000000];
  [assert_equal int:10000000 int:[number intValue]];
  [assert_equal int:10000000 b:number];
  [assert_equal bool:true bool:[number boolValue]];
  [assert_equal a:@"10000000" b:[number stringValue]];
  [assert_equal a:@"10000000" b:number];

  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setNumberStyle:kCFNumberFormatterDecimalStyle];
  [numberFormatter setGroupingSeparator:@","];
  [assert_equal a:@"," b:[numberFormatter groupingSeparator]];
  [assert_equal a:@"10,000,000" b:[numberFormatter stringForObjectValue:number]];
  [numberFormatter release];

  [assert_equal float:0.9f float:1.0f - 0.1f];
  [assert_equal float:1.2f b:[NSNumber numberWithFloat:1.2f]];

}

@end
