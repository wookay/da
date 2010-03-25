// NSInvocationOperationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSInvocationOperation)

- (void) test_NSInvocationOperation {

  #if TARGET_CPU_X86
  NSString* target = @"test target";
  SEL selector = NSSelectorFromString(@"length");
  NSInvocationOperation* op = [[NSInvocationOperation alloc]
    initWithTarget:target selector:selector object:nil];
  NSInvocation* invocation = [op invocation];
  assert_equal(@"test target", [invocation target]);
  assert_equal(@selector(length), [invocation selector]);
  [invocation invoke];
  int value;
  [invocation getReturnValue:&value];
  assert_equal(11, value);

  NSUInteger ret = (NSUInteger) [target performSelector:@selector(length)];
  assert_equal(11, ret);
  #endif

  id number = [NSDecimalNumber numberWithInt:100];
  SEL plus = @selector(decimalNumberByAdding:);
  assert_equal(true, [number respondsToSelector:plus]);
  assert_equal(200, [number performSelector:plus withObject:[NSDecimalNumber numberWithInt:100]]);

  Class class = NSClassFromString(@"NSString");
  assert_equal(@"NSString", NSStringFromClass(class));
  assert_equal(@"NSCFString", NSStringFromClass([@"" class]));
  assert_equal(@"NSDecimalNumber", NSStringFromClass([number class]));

}

@end
