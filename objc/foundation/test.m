// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//  [UnitTest setup];
//  [[UnitTest target:@"TestSuite"] run_test:@selector(test_NSMutableDictionary)];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_NSMutableArray)];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_NSArray)];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_NSString)];
//  [UnitTest report];

 [UnitTest run_all_tests];

  [pool release];
  return 0;
}
