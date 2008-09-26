// GLTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "GL.h"

@implementation GLTest

- (void) unittest {

  id gl = [GL create];
  [gl loadIdentity];
  [assert_equal a:[NSArray arrayWithObject:@"glLoadIdentity"] b:gl];

}

@end
