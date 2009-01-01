// me2array.m
//                           wookay.noh at gmail.com

#import "me2array.h"

@implementation NSArray ( me2day )

-(id) first {
  if ([self count] > 0) {
    return [self objectAtIndex:0];
  } else {
    return nil;
  }
}

@end
