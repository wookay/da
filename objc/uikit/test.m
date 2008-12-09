// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [[UnitTest alloc] init];
  [unittest run:@"UIWebViewTest"];
  [unittest run:@"UIGraphicsTest"];
  [unittest run:@"UIImageTest"];
  [unittest run:@"UIColorTest"];
  [unittest run:@"UIViewTest"];
  [unittest report];

  [pool release];
  return 0;
}
