// Ord.m
//                           wookay.noh at gmail.com

#import "Ord.h"

@implementation OrderedDictionary

- (id)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)count {
  NSMutableArray* ary = [NSMutableArray array];
  int idx;
  for (idx = 0; idx < count; idx ++) {
    [ary addObject:*(keys+idx)];
  }
  [self setValue:ary forKey:ORD_KEYS];

  NSDictionary* dic = [NSDictionary dictionaryWithObjects:objects
                                    forKeys:keys count:count];
  [self setValue:dic forKey:ORD_DICTIONARY];
  return self;
}

- (int) count {
  return [ordKeys count];
}

- (id) allKeys {
  return ordKeys;
}

- (NSEnumerator*) keyEnumerator {
  return [[self allKeys] objectEnumerator];
}

- (id) objectForKey:(id)key {
  return [ordDictionary objectForKey:key];
}

- (id) valueForKey:(id)key {
  return [self objectForKey:key];
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

@end
