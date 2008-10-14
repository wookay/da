// UIImageTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIImageTest

- (void) unittest {

//  id path = @"http://img0.gmodules.com/ig/f/oKstlUEg20s/intl/ALL_kr/logo.gif";
//  NSURL *url = [NSURL URLWithString:path];
  NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Icon" ofType:@"png"]];  
  NSData *data = [NSData dataWithContentsOfURL:url];
  UIImage *img = [[UIImage alloc] initWithData:data];
  [assert_equal a:@"{57, 57}" CGSize:[img size]];
  
}

@end