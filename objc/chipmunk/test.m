// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"BodyTest"];
  [unittest run:@"SpaceTest"];
  [unittest run:@"ShapeTest"];
  [unittest run:@"JointTest"];
  [unittest report];

  [pool release];
  return 0;
}
