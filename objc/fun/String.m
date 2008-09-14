// String.m
//                           wookay.noh at gmail.com

#import "String.h"

@implementation NSString ( String )

- (int) to_i {
  return [self intValue];
}

- (float) to_f {
  return [self floatValue];
}

- (id) to_range {
  NSArray* ary = [self componentsSeparatedByString:@".."];
  int fst = [[ary objectAtIndex:0] intValue];
  int snd = [[ary objectAtIndex:1] intValue];
  NSMutableArray* ret = [NSMutableArray array];
  int num;
  for (num = fst; num < snd + 1 ; num++) {
    [ret addObject:[NSNumber numberWithInt:num]];
  }
  return ret;
}

- (id) split {
  return [self split:@" "];
}

- (id) split:(id)sep {
  return [self componentsSeparatedByString:sep];
}

@end
