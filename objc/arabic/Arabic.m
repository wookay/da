// Arabic.m
//                           wookay.noh at gmail.com

#import "Arabic.h"

@implementation NSString ( Arabic )

- (int) to_i {
  int ret = 0;
  int idx;
  for (idx = 0;idx < [self length]; idx++) {
    unichar c = [self characterAtIndex:idx];
    int n = c & 0xFFFF;
    ret += (n - 1632) * pow(10, [self length] - 1 - idx);
  }
  return ret;
}

+ (id) arabicWithInt:(int)number {
  NSMutableArray* ret = [NSMutableArray array];
  NSString* num = [[NSNumber numberWithInt:number] stringValue];
  int idx;
  for (idx = 0;idx < [num length]; idx++) {
    unichar c = [num characterAtIndex:idx];
    int n = [[NSString stringWithFormat:@"%C", c] intValue];
    [ret addObject:[NSString stringWithFormat:@"%C", n + 1632]];
  }
  return [ret componentsJoinedByString:@""];
}

@end
