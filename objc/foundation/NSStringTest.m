// NSStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"


@interface TestSuite (NSString)
- (void) test_NSString ;
@end

@implementation TestSuite (NSString)

- (void) test_NSString {

  NSString* str = [NSString stringWithFormat:@"%d", 200];
  
  assert_equal(@"200", str);

  assert_equal(200, [str intValue]);
  
  NSArray* ary = [@"1 2 3" componentsSeparatedByString:@" "];
  assert_equal(@"[1, 2, 3]", [ary inspect]);

  assert_equal(@"1 2.100000", ([@"1" stringByAppendingFormat:@" %f", 2.1f]));

  double d = 10.1;
  assert_equal(@"10.100000", ([NSString stringWithFormat:@"%f", d]));
  assert_equal(@"1.010000e+01", ([NSString stringWithFormat:@"%e", d]));
  assert_equal(@"1.010000E+01", ([NSString stringWithFormat:@"%E", d]));
  assert_equal(@"10.1", ([NSString stringWithFormat:@"%g", d]));
  assert_equal(@"10.1", ([NSString stringWithFormat:@"%G", d]));

  assert_equal(NSMakeRange(6,3), [@"hello apple" rangeOfString:@"app"]);
  assert_equal(NSMakeRange(NSNotFound,0),
               [@"hello apple" rangeOfString:@"mac"]);
  
  assert_equal(true, [@"abc" isEqualToString:@"abc"]);
  assert_equal(true, [@"abc" hasPrefix:@"ab"]);
  assert_equal(true, [@"abc" hasSuffix:@"bc"]);

  assert_equal(@"0f", ([NSString stringWithFormat:@"%02x", 15]));

  NSString* file = @"test.png";
  NSRange range = [file rangeOfString:@"." options:NSBackwardsSearch];
  if (range.location != NSNotFound) {
    assert_equal(@"test", [file substringToIndex:range.location]);
    range.location += 1;
    range.length = file.length - range.location;
    assert_equal(@"png", [file substringWithRange:range]);
  }

  assert_equal(1, [@"1/" intValue]);

  NSString* strip = [@" ab cd " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  assert_equal(@"ab cd", strip);

  assert_equal(@"ab1", [@"ab1" substringFromIndex:0]);
  assert_equal(@"b1", [@"ab1" substringFromIndex:1]);
  assert_equal(@"1", [@"ab1" substringFromIndex:2]);

  assert_equal(@"", [@"ab1" substringToIndex:0]);
  assert_equal(@"a", [@"ab1" substringToIndex:1]);
  assert_equal(@"ab", [@"ab1" substringToIndex:2]);

  assert_equal(@"a", [@"ab1" substringWithRange:NSMakeRange(0, 1)]);
  assert_equal(@"b", [@"ab1" substringWithRange:NSMakeRange(1, 1)]);
  assert_equal(@"1", [@"ab1" substringWithRange:NSMakeRange(2, 1)]);

  assert_equal(false, [@"0 a,b,c" boolValue]);
  assert_equal(true, [@"1 a,b,c" boolValue]);

  assert_equal(@"1", ([NSString stringWithFormat:@"%s", "1"]));
  assert_equal(@"1    ", ([NSString stringWithFormat:@"% -5s", "1"]));

}

@end
