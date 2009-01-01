// test.m
//                           wookay.noh at gmail.com

#import "test.h"

id fixture(id file) {
  NSError* err;
  id path = [NSString stringWithFormat:@"fixtures/%@", file];
  id data = [NSString stringWithContentsOfFile:path
    encoding:NSUTF8StringEncoding error:&err];
  //NSLog(@"data %@", data);
  return [data JSONValue];
}

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"TestPost"];
  [unittest run:@"TestPosts"];
  [unittest run:@"TestPerson"];
  [unittest run:@"TestMetoos"];
  [unittest run:@"TestNoop"];
  [unittest run:@"TestSetting"];
  [unittest run:@"TestComment"];
  [unittest report];

  [pool release];
  return 0;
}
