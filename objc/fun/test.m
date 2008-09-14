// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"EnumerableTest"];
  [unittest run:@"NumericTest"];
  [unittest run:@"ArrayTest"];
  [unittest run:@"StringTest"];
  [unittest report];

  [pool release];
  return 0;
}
