// Array.m
//                           wookay.noh at gmail.com

#import "Array.h"

@implementation ArrayProxy

- (id) initWithArray:(NSArray*)ary {
  array = ary;
  return self;
}

- (void) forwardInvocation:(NSInvocation*)invocation {
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in array) {
    [ary addObject:[obj performSelector:[invocation selector]]];
  }
  [invocation setReturnValue:&ary];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
  if ([array count] > 0) {
    return [[array objectAtIndex:0] methodSignatureForSelector:selector];
  } else {
    return [NSArray instanceMethodSignatureForSelector:@selector(count)];
  }
}

@end



@implementation NSArray ( Array )

- (id) join {
  return [self join:@""];
}

- (id) to_s {
  return [self join];
}

- (id) join:(id)sep {
  return [self componentsJoinedByString:sep];
}

- (id) first {
  return [self objectAtIndex:0];
}

- (id) last {
  return [self lastObject];
}

- (id) reverse {
  NSMutableArray* ary = [NSMutableArray array];
  for (id obj in [self reverseObjectEnumerator]) {
    [ary addObject:obj];
  }
  return ary;
}

- (int) size {
  return [self count];
}

- (bool) empty:(char)question {
  return [self count] == 0;
}

- (id) map {
  return [[ArrayProxy alloc] initWithArray:self];
}

- (NSArray*) map:(SEL)selector {
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in self) {
    [ary addObject:[obj performSelector:selector]];
  }
  return ary;
}

@end



@implementation NSMutableArray ( Array )

- (id) push:(id)obj {
  [self addObject:obj];
  return self;
}

- (id) pop {
  if ([self count] == 0) {
    return nil;
  }
  
  int last_idx = [self count] - 1;
  id obj = [[self objectAtIndex:last_idx] retain];
  [self removeObjectAtIndex:last_idx];
  return obj;
}

@end
