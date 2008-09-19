// HangulTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation HangulTest

- (void) unittest {

  [assert_equal a:[@"ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ"
                     componentsSeparatedByString:@" "]
                b:[@"" chosungs]];

  [assert_equal a:[NSArray arrayWithObjects:@"ㄱ", @"ㅏ", @"", nil]
                b:[@"가" separate]];

  [assert_equal a:@"가" b:[@"우리" get_josa:@"이"]];
  [assert_equal a:@"는" b:[@"우리" get_josa:@"은"]];
  [assert_equal a:@"이" b:[@"우리들" get_josa:@"이"]];
  [assert_equal a:@"은" b:[@"우리들" get_josa:@"은"]];

}

@end
