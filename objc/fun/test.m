// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* unittest = [UnitTest create];
  [unittest run:@"EnumerableTest"];
  [unittest run:@"NumericTest"];
  [unittest run:@"StringTest"];
  [unittest run:@"ArrayTest"];
  [unittest run:@"HashTest"];
  [unittest run:@"OrdTest"];
  [unittest run:@"FunctionTest"];
  [unittest run:@"AssertTest"];
  [unittest run:@"ObjectTest"];
  [unittest run:@"SingletonTest"];
  [unittest run:@"KVCTest"];
  [unittest report];

  [pool release];
  return 0;
}
