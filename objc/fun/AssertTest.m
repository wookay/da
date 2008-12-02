// AssertTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation AssertTest

- (void) unittest {

  assert(1);
  assert(! 0);
  assert(! NULL);
  assert(! nil);
  assert("");
  assert(@"");
  
}

@end
