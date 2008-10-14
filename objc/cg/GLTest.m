// GLTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "GL.h"

@implementation GLTest

- (void) unittest {

  id gl = [GL create:nil];
  [gl loadIdentity];
  [assert_equal a:[NSArray arrayWithObject:@"glLoadIdentity"] b:gl];

  GLuint color = 0x0000ffff;
  GLubyte r, g, b, a;
  r = (color>>24) & 0xff;
  g = (color>>16) & 0xff;
  b = (color>>8) & 0xff;
  a = (color) & 0xff;
  [assert_equal _true:r==0];
  [assert_equal _true:g==0];
  [assert_equal _true:b==0xff];
  [assert_equal _true:a==0xff];

}

@end
