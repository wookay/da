// UIImageTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIImageTest

- (void) unittest {

  //id path = @"http://img0.gmodules.com/ig/f/oKstlUEg20s/intl/ALL_kr/logo.gif";
  //NSURL *url = [NSURL URLWithString:path];
  //NSData *data = [NSData dataWithContentsOfURL:url];
  id path = @"Icon.png";
  NSData *data = [NSData dataWithContentsOfFile:path];
  UIImage *img = [[UIImage alloc] initWithData:data];
  UIImageView* imageView = [UIImageView alloc];
  [imageView setImage:img];
  [assert_equal a:img b:[imageView image]];

}

@end
