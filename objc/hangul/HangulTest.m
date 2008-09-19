// HangulTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation HangulTest

- (void) unittest {

  [assert_equal a:[NSArray arrayWithObjects:U("ㄱ"), U("ㅏ"), @"", nil]
                b:[U("가") separate]];

  [assert_equal a:[NSArray arrayWithObjects:U("ㅇ"), U("ㄹ"), nil]
                b:[U("우리") chosungs]];
  [assert_equal a:[NSArray arrayWithObjects:U("ㅜ"), U("ㅣ"), nil]
                b:[U("우리") jungsungs]];

  [assert_equal a:U("가") b:[U("우리") get_josa:U("이")]];
  [assert_equal a:U("는") b:[U("우리") get_josa:U("은")]];
  [assert_equal a:U("이") b:[U("우리들") get_josa:U("이")]];
  [assert_equal a:U("은") b:[U("우리들") get_josa:U("은")]];

}

@end
