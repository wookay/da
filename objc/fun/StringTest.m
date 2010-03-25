// StringTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "String.h"
#import "Array.h"

@implementation TestSuite (String)

- (void) test_String {

  NSString* str = @"a b c";
  assert_equal(@"a b c", str);
  assert_equal(@"(a, b, c)", [str split]);
  assert_equal(@"abc", [[str split] join]);
  assert_equal(@"a,b,c", [[str split] join:@","]);
  assert_equal(@"(a, b, c)", [[[str split] join:@","] split:@","]);
  assert_equal(true, [@"" empty:'?']);
  assert_equal(@"a,b,c", [@"a b c" gsub:@" " to:@","]);
  assert_equal(true, [@"abc" included:@"a"]);
  assert_equal(false, [@"abc" included:@"A"]);

}

@end
