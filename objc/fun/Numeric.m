// Numeric.m
//                           wookay.noh at gmail.com

#import "Numeric.h"

@implementation NSNumber ( Numeric )

- (int) to_i {
  return [self intValue];
}

- (float) to_f {
  return [self floatValue];
}

- (id) to_s {
  return [self stringValue];
}

@end
