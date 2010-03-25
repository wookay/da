// ObjectTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import <objc/runtime.h>
#import "Object.h"
#import "String.h"

id func(id self, SEL _cmd) {
  return @"ok";
}

@implementation TestSuite (Object)

- (id) inst_method {
  return @"instance method";
}

- (int) plus:(id)obj {
  id number = self;
  return [number intValue] + [obj intValue];
}

- (void) test_Object {

  assert_equal(@"(_frame, _retdata, _signature, _container, _retainedArgs, _reserved)" 
               , [NSInvocation instance_variables]);
  assert_equal(18, [[NSInvocation methods] count]);
  assert_equal(36, [[@"" methods] count]);
  //assert_equal int:217 int:[[NSString methods] count]);
  assert_equal(@"A B", [@"a b" send:@"uppercaseString"]);
  assert_equal(([NSArray arrayWithObjects:@"a", @"b", nil]),
               [@"a b" send:@"split" withObject:@" "]);
  assert_equal(@"@\"a b\"", [@"a b" inspect]);
  assert_equal(@"[NSArray arrayWithObjects:@\"a\", @\"b\", nil]"
               , [[@"a b" split:@" "] inspect]);
  
  [NSArray def:@"function" id:(IMP)func];
  assert_equal(@"ok", [[NSArray array] function]);

  Class MyClass = [self class:@"MyClass" superclass:@"NSObject"];
  [MyClass def:@"function" id:(IMP)func];
  assert_equal(@"ok", [[MyClass alloc] function]);

  IMP imp = class_getMethodImplementation([self class], @selector(inst_method));
  [MyClass def:@"inst method" id:(IMP)imp];
  assert_equal(@"instance method", (id)[[MyClass alloc] send:@"inst method"]);

  IMP plus = class_getMethodImplementation([self class], @selector(plus:));
  [NSNumber def:@"+" int:(IMP)plus];
  assert_equal(3, (int)[[NSNumber numberWithInt:1] send:@"+" int:2]);

}

@end
