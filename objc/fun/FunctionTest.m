// FunctionTest.m
//                           wookay.noh at gmail.com

#import "test.h"

int next(int n) {
  return n + 1;
}

@implementation FunctionTest

- (void) unittest {
  
  [assert_equal int:1 int:[self call:next number:0]];
}

- (int) call:(funcPtr)func number:(int)number {
  return func(number);
}

@end
