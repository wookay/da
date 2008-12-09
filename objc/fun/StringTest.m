// StringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation StringTest

- (void) unittest {

  NSString* str = @"a b c";
  [assert_equal a:@"a b c" b:str];
  [assert_equal a:@"(a, b, c)" b:[str split]];
  [assert_equal a:@"abc" b:[[str split] join]];
  [assert_equal a:@"a,b,c" b:[[str split] join:@","]];
  [assert_equal a:@"(a, b, c)" b:[[[str split] join:@","] split:@","]];
  [assert_equal _true:[@"" empty:'?']];
  [assert_equal a:@"a,b,c" b:[@"a b c" gsub:@" " to:@","]];

}

@end
