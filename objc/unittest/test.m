// test.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  NSString* str = @"1 2 3";
  NSArray* ary = [str componentsSeparatedByString:@" "];

  UnitTest* assert_equals = [UnitTest alloc];
  [assert_equals a:@"(1, 2, 3)" b:[ary description]];
  [assert_equals a:@"(1, 2, 3)" b:ary];
  [assert_equals a:@"1,2,3" b:[ary componentsJoinedByString:@","]];
  [assert_equals i:6 j:1+2+3];

  [pool release];
  return 0;
}
