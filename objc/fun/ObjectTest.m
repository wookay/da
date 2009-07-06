// ObjectTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import <objc/runtime.h>

id func(id self, SEL _cmd) {
  return @"ok";
}

@implementation ObjectTest

- (id) inst_method {
  return @"instance method";
}

- (int) plus:(id)obj {
  id number = self;
  return [number intValue] + [obj intValue];
}

- (void) unittest {

  [assert_equal a:@"(_frame, _retdata, _signature, _container, _retainedArgs, _reserved)" 
                b:[NSInvocation instance_variables]];
  [assert_equal int:18 int:[[NSInvocation methods] count]];
  [assert_equal int:36 int:[[@"" methods] count]];
  //[assert_equal int:217 int:[[NSString methods] count]];
  [assert_equal a:@"A B" b:[@"a b" send:@"uppercaseString"]];
  [assert_equal a:[NSArray arrayWithObjects:@"a", @"b", nil]
                b:[@"a b" send:@"split" withObject:@" "]];
  [assert_equal a:@"@\"a b\"" b:[@"a b" inspect]];
  [assert_equal a:@"[NSArray arrayWithObjects:@\"a\", @\"b\", nil]"
                b:[[@"a b" split:@" "] inspect]];
  
  [NSArray def:@"function" id:(IMP)func];
  [assert_equal a:@"ok" b:[[NSArray array] function]];

  Class MyClass = [self class:@"MyClass" superclass:@"NSObject"];
  [MyClass def:@"function" id:(IMP)func];
  [assert_equal a:@"ok" b:[[MyClass alloc] function]];

  IMP imp = class_getMethodImplementation([self class], @selector(inst_method));
  [MyClass def:@"inst method" id:(IMP)imp];
  [assert_equal a:@"instance method" b:(id)[[MyClass alloc] send:@"inst method"]];

  IMP plus = class_getMethodImplementation([self class], @selector(plus:));
  [NSNumber def:@"+" int:(IMP)plus];
  [assert_equal int:3 int:(int)[[NSNumber numberWithInt:1] send:@"+" int:2]];

}

@end
