// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [[UnitTest alloc] init];
  [unittest run:@"NSObjectTest"];
  [unittest run:@"NSNumberTest"];
  [unittest run:@"NSStringTest"];
  [unittest run:@"NSArrayTest"];
  [unittest run:@"NSMutableArrayTest"];
  [unittest run:@"NSMutableSetTest"];
  [unittest run:@"NSMutableDictionaryTest"];
  [unittest run:@"NSDataTest"];
  [unittest run:@"NSDateTest"];
  [unittest run:@"NSErrorTest"];
  [unittest run:@"NSProcessInfoTest"];
  [unittest run:@"NSNotificationTest"];
  [unittest run:@"NSBundleTest"];
  [unittest run:@"DataTypesTest"];
  [unittest report];

  [pool release];
  return 0;
}
