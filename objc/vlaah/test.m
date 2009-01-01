// test.m
//                           wookay.noh at gmail.com

#import "test.h"

id fixture(id file) {
  NSError* err;
  id path = [NSString stringWithFormat:@"fixtures/%@", file];
  id xml = [NSString stringWithContentsOfFile:path
    encoding:NSUTF8StringEncoding error:&err];
  return xml;
}

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"TestCommentList"];
  [unittest run:@"TestPerson"];
  [unittest run:@"TestTopic"];
  [unittest run:@"TestBase"];
  [unittest report];

  [pool release];
  return 0;
}
