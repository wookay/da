// test.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  NSString* str = @"1 2 3";
  NSArray* ary = [str componentsSeparatedByString:@" "];

  UnitTest* assert_equal = [UnitTest alloc];
  [assert_equal a:@"(1, 2, 3)" b:ary];
  [assert_equal a:@"1,2,3" b:[ary componentsJoinedByString:@","]];
  [assert_equal int:6 int:1+2+3];

  [pool release];
  return 0;
}
