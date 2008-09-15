// Hash.m
//                           wookay.noh at gmail.com

#import "Hash.h"

@implementation NSMutableDictionary ( Hash )

- (id) to_s {
  NSMutableString* str = [NSMutableString string];
  for (id key in self) {
    [str appendFormat:@"%@", key];
    [str appendFormat:@"%@", [self valueForKey:key]];
  }
  return str;
}

- (id) store:(id)key v:(id)obj {
  [self setObject:obj forKey:key];
  return obj; 
}

- (id) fetch:(id)key {
  return [self valueForKey:key];
}

- (bool) empty:(char)question {
  return [self count] == 0;
}

@end
