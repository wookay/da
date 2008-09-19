// NSDateTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSDateTest

- (void) unittest {

  NSDate* today = [NSDate date];
  [assert_equal int:[@"YYYY-MM-DD HH:MM:SS +HHMM" length]
                int:[[today description] length]];

  #if TARGET_CPU_X86
  NSDate* sept = [NSDate dateWithString:@"2008-09-10 11:12:13 +0900"];
  [assert_equal a:@"2008-09-10 11:12:13 +0900" b:sept];
  NSDate* oct = [NSDate dateWithNaturalLanguageString:@"11am October 10, 2008"];
  [assert_equal a:@"2008-10-10 11:00:00 +0900" b:oct];
  #endif

}

@end
