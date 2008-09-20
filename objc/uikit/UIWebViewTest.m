// UIWebViewTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIWebViewTest

- (void) unittest {

  UIWebView* view = [[UIWebView alloc] init];
  [assert_equal a:@"3" b:[view stringByEvaluatingJavaScriptFromString:@"1+2"]];

}

@end
