// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"CGContextTest"];
  [unittest run:@"CGPathTest"];
  [unittest run:@"CGGlyphTest"];
  [unittest run:@"CGAffineTransformTest"];
  [unittest run:@"CGRectTest"];
  [unittest report];

  [pool release];
  return 0;
}
