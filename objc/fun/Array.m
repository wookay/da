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

- (id) push:(id) obj {
  return [self arrayByAddingObject:obj];
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

- (int) length {
  return [self size];
}

@end
