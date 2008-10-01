// ArabicTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation ArabicTest

- (void) unittest {

  [assert_equal int:0 int:[U("") to_i]];
  [assert_equal int:0 int:[U("٠") to_i]];
  [assert_equal int:26 int:[U("٢٦") to_i]];

  [assert_equal a:U("٠") b:[NSString arabicWithInt:0]];
  [assert_equal a:U("٢٦") b:[NSString arabicWithInt:26]];

}

@end
