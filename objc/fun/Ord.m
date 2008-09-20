// Ord.m
//                           wookay.noh at gmail.com

#import "Ord.h"

@implementation OrderedDictionary

+ (id) dictionaryWithObjectsAndKeys:(id)value, ... {
  NSMutableArray* ord = [NSMutableArray array];
  NSMutableDictionary* dic = [NSMutableDictionary dictionary];
  if (value) {
    va_list argList;
    va_start(argList, value);
    id obj;
    int idx = 0;
    while ((obj = va_arg(argList, id))) {
      if (idx % 2 == 0) {
        [ord addObject:obj];
        [dic setObject:value forKey:obj];
      } else {
        value = obj;
      }
      idx++;
    }
    va_end(argList);
  }
  self = [self alloc]; 
  [self setValue:ord forKey:ORD_KEYS];
  [self setValue:dic forKey:ORD_DICTIONARY];
  return self;
}

+ (id) dictionaryWithObjectsAndKeysFromArray:(id)array {
  NSMutableArray* ord = [NSMutableArray array]; 
  NSMutableDictionary* dic = [NSMutableDictionary dictionary];
  for (id tuple in array) {
    id key = [tuple lastObject];
    id value = [tuple objectAtIndex:0];
    if ([ord containsObject:key]) {
      id ary = [dic valueForKey:key];
      [dic setObject:[ary arrayByAddingObject:value] forKey:key];
    } else {
      [ord addObject:key];
      [dic setObject:[NSArray arrayWithObject:value] forKey:key];
    }
  }
  self = [self alloc]; 
  [self setValue:ord forKey:ORD_KEYS];
  [self setValue:dic forKey:ORD_DICTIONARY];
  return self;
}

- (id) objectForKey:(id)key {
  return [self valueForKey:key];
}

- (id) valueForKey:(id)key {
  return [ordDictionary valueForKey:key];
}

- (id) allKeys {
  return ordKeys;
}

- (id) allValues {
  NSMutableArray* ary = [NSMutableArray array];
  for (id key in [self allKeys]) {
    [ary addObject:[self valueForKey:key]];
  }
  return ary;
}

@end
