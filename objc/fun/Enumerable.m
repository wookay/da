// Enumerable.m
//                           wookay.noh at gmail.com

#import "Enumerable.h"

@implementation NSArray ( Enumerable )

- (id) sum {
  return [self reduce:@"+"]; 
}

- (id) reduce:(NSString*)op {

  if ([self count] == 0) {
    return nil;
  }

  id first = [self objectAtIndex:0];
  if ([self count] == 1) {
    return first;
  }

  int ret = [first intValue];
  id rest = [self subarrayWithRange:NSMakeRange(1, [self count] - 1)];
  for (id obj in rest) {
    if ([op isEqualToString:@"+"]) {
      ret += [obj intValue];
    } else if ([op isEqualToString:@"*"]) {
      ret *= [obj intValue];
    } else if ([op isEqualToString:@"-"]) {
      ret -= [obj intValue];
    } else if ([op isEqualToString:@"/"]) {
      ret /= [obj intValue];
    } else if ([op isEqualToString:@"%"]) {
      ret %= [obj intValue];
    }
  }

  return [NSNumber numberWithInt:ret];
}

@end
