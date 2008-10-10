// UIImageViewTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIImageViewTest

- (void) unittest {

  id path = @"http://img0.gmodules.com/ig/f/oKstlUEg20s/intl/ALL_kr/logo.gif";
  NSURL *url = [NSURL URLWithString:path];
  NSData *data = [NSData dataWithContentsOfURL:url];
  UIImage *img = [[UIImage alloc] initWithData:data];
  // [view setImage:img];

}

@end
