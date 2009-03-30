// Singleton.m
//                           wookay.noh at gmail.com

#import "Singleton.h"

@implementation Singleton

+ (id) sharedMethod {
  static Singleton* shared = nil;
  if (! shared) {
    shared = [[self alloc] init];
  }
  return shared;
}

@end
