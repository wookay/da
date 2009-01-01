// TestPerson.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestPerson

- (void) unittest {

  Person* person = [Person find:@"~dahlia"];
  if (LOCAL_TEST) {
    person.raw_data = fixture(@"person.xml");
  }
  [assert_equal a:@"Hong, MinHee" b:[person nick]];
  [assert_equal a:@"http://static.vlaah.com/pictures/dahlia.128.png?1229610628"
                b:[person picture_url]];
  [assert_equal float:83.88396 float:person.percent.plus];

}

@end
