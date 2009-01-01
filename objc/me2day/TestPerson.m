// TestPerson.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestPerson

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id person;

  person = [me2day get_person:@"codian"];
  if (LOCAL_TEST) {
    person = fixture(@"codian.json");
  }
  [assert_equal a:@"미투데이 만드는 꽃띠앙입니다. 미투데이 사용하시다가 문제 있으시면 help@me2day.net 으로 연락주세요"
                b:[person description]];
  [assert_equal a:@"1" b:[[[person postIcons] first] default]];

  [me2day release];

}

@end
