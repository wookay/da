// FunctionTest.m
//                           wookay.noh at gmail.com

#import "test.h"

typedef int( *funcPtr )( int );

int next(int n) {
  return n + 1;
}


@interface TestSuite (Function)
- (int) call:(funcPtr)func number:(int)number ;
@end


@implementation TestSuite (Function)

- (void) test_Function {
  
  assert_equal(1, [self call:next number:0]);
}

- (int) call:(funcPtr)func number:(int)number {
  return func(number);
}

@end
