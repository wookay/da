// test.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [[UnitTest alloc] init];
  [unittest run:@"HelloTest"];
  [unittest report];

  [pool release];
  return 0;
}
