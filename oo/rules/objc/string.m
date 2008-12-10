// string.m
//                           wookay.noh at gmail.com

#import "pol.h"
#import ".oo.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  NSMutableArray* args = [NSMutableArray array];
  int idx;
  for (idx = 1; idx < argc; idx++) {
    [args addObject:[NSString stringWithUTF8String:argv[idx]]];
  }
  [[[Pol alloc] new:@"capitalizedString lowercaseString uppercaseString" path:RULES_PREFERENCES] call:args];

  [pool release];
  return 0;
}
