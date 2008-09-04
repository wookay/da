// NSInvocationOperationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSInvocationOperationTest

- (void) unittest:(id)assert_equal {

  NSString* target = @"test target";
  SEL selector = NSSelectorFromString(@"length");
  NSInvocationOperation* op = [[NSInvocationOperation alloc]
    initWithTarget:target selector:selector object:nil];
  NSInvocation* invocation = [op invocation];
  [invocation invoke];
  int value;
  [invocation getReturnValue:&value];
  [assert_equal a:@"test target" b:[invocation target]];
  [assert_equal a:@"length" SEL:[invocation selector]];
  [assert_equal int:11 int:value];

  int ret = (int) [target performSelector:@selector(length)];
  [assert_equal int:11 int:ret];

  id number = [NSDecimalNumber numberWithInt:100];
  SEL plus = @selector(decimalNumberByAdding:);
  [assert_equal _true:[number respondsToSelector:plus]];
  [assert_equal int:200 b:[number performSelector:plus withObject:[NSDecimalNumber numberWithInt:100]]];

  Class class = NSClassFromString(@"NSString");
  [assert_equal a:@"NSString" b:NSStringFromClass(class)];

}

@end
