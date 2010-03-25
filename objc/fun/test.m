// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//  [UnitTest setup];
//  [[UnitTest target:@"TestSuite"] run_test:@selector(test_NSMutableDictionary)];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_NSMutableArray)];
  //[[UnitTest target:@"TestSuite"] test_Array];
 // [[[TestSuite alloc] init] test_Array];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_Array)];
  //[[UnitTest target:@"TestSuite"] run_test:@selector(test_NSString)];
//  [UnitTest report];

  [UnitTest run_all_tests];

  [pool release];
  return 0;
}
