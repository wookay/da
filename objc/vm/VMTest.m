// VMTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation VMTest

- (void) unittest {
}

- (void) info {
  VM* vm = [VM vm];
  NSLog(@"    Free: %7.2f MB", vm.free / 1000 / 1000);
  NSLog(@"   Wired: %7.2f MB", vm.wired / 1000 / 1000);
  NSLog(@"  Active: %7.2f MB", vm.active / 1000 / 1000);
  NSLog(@"Inactive: %7.2f MB", vm.inactive / 1000 / 1000);
  NSLog(@"   Total: %7.2f MB", vm.total / 1000 / 1000);
}

@end
