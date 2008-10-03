// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [[UnitTest alloc] init];
  [unittest run:@"CALayerTest"];
  [unittest run:@"CATiledLayerTest"];
  [unittest run:@"CATransform3DTest"];
  [unittest run:@"CAKeyframeAnimationTest"];
  [unittest run:@"CABasicAnimationTest"];
  [unittest report];

  [pool release];
  return 0;
}
