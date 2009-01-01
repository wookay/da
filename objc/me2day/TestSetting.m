// TestSetting.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSetting

- (void) unittest {

  id me2day = [[Me2day alloc] username:USERNAME userkey:USERKEY];
  id settings;
  settings = [me2day get_settings];
  if (LOCAL_TEST) {
    settings = fixture(@"settings.json");
  }
  if (settings) {
    [assert_equal a:@"codian" b:[settings settingsOf]];
    [assert_equal a:@"내일 뛰지 않으려면 오늘 가야지" b:[settings description]];
    [assert_equal a:@"코디안 구글 수만박 미투백일잔치" b:[settings mytags]];
    [assert_equal a:@"코디안 구글 수만박" b:[settings mytagsInTab]];
    [assert_equal a:@"미투스탭 멋쟁이들 이쁜이들" b:[settings groups]];
  } else {
  }

  [me2day release];

}

@end
