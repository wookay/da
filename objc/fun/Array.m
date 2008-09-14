// Array.m
//                           wookay.noh at gmail.com

#import "Array.h"

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
