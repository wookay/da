// Object.m
//                           wookay.noh at gmail.com

#import "Object.h"
#import "Array.h"

@implementation NSObject ( Object )

- (void) instance_variable_set:(id)name value:(id)value {
  object_setInstanceVariable(self, [name UTF8String], value);
}

- (id) instance_variable_get:(id)name {
  Ivar ivar = class_getInstanceVariable([self class], [name UTF8String]);
  return object_getIvar(self, ivar);
}

- (NSArray*) instance_variables {
  NSMutableArray* ary = [NSMutableArray array];
  unsigned int count = 0;
  Ivar* ivarList = class_copyIvarList([self class], &count);
  int idx;
  for(idx = 0; idx < count; idx++) {
    const char* name = ivar_getName(ivarList[idx]);
    [ary addObject:[NSString stringWithUTF8String:name]];
  }
  free(ivarList);
  return ary;
}

- (id) send:(NSString*)method {
  return [self performSelector:NSSelectorFromString(method)];
}

- (id) send:(NSString*)method withObject:(id)anObject {
  return [self performSelector:NSSelectorFromString(method) withObject:anObject];
}

- (id) send:(NSString*)method withObject:(id)anObject withObject:(id)anotherObject {
  return [self performSelector:NSSelectorFromString(method) withObject:anObject withObject:anotherObject];
}

- (id) send:(NSString*)method int:(int)value {
  NSNumber* anObject = [NSNumber numberWithInt:value];
  return [self performSelector:NSSelectorFromString(method) withObject:anObject];
}

- (NSArray*) methods {
  NSMutableArray* ary = [NSMutableArray array];
  unsigned int count = 0;
  Method* list = class_copyMethodList([self class], &count);
  int idx;
  for(idx = 0; idx < count; idx++) {
    SEL name = method_getName(list[idx]);
    [ary addObject:NSStringFromSelector(name)];
  }
  free(list);
  return ary;
}

- (NSString*) inspect {
  if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
    id array = self;
    NSArray* ary = (NSArray*) [[array map] inspect];
    return [NSString stringWithFormat:@"[NSArray arrayWithObjects:%@, nil]",
      [ary componentsJoinedByString:@", "]];
  } else if ([self isKindOfClass:[NSString class]]) {
    return [NSString stringWithFormat:@"@\"%@\"", self];
  } else {
    return [self description];
  }
}

- (Class) class:(id)className superclass:(id)superclassName {
  Class klass = objc_allocateClassPair(NSClassFromString(superclassName), [className UTF8String], 0);
  objc_registerClassPair(klass);
  return klass;
}

- (void) def:(NSString*)method id:(IMP)block {
  class_addMethod([self class], NSSelectorFromString(method), block, "@@:");
}

- (void) def:(NSString*)method int:(IMP)block {
  class_addMethod([self class], NSSelectorFromString(method), block, "i@:");
}

- (void) def:(NSString*)method void:(IMP)block {
  class_addMethod([self class], NSSelectorFromString(method), block, NULL);
}

- (void) def:(NSString*)method Method:(Method)block {
  class_addMethod([self class], NSSelectorFromString(method),
    method_getImplementation(block), method_getTypeEncoding(block));
}

@end
