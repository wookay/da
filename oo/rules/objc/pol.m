// pol.m
//                           wookay.noh at gmail.com

#import "pol.h"
#import ".oo.h"

@implementation Pol
- (id) new:(NSString*)_syms path:(id)_path{
  syms = [_syms componentsSeparatedByString:@" "];
  path = _path;
  return self;
}
- (id) mappings {
  id data = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:path]
                              encoding:NSUTF8StringEncoding];  
  data = [data stringByReplacingOccurrencesOfString:@"[[\""
               withString:@""];
  data = [data stringByReplacingOccurrencesOfString:@"\"]]"
               withString:@""];
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in [data componentsSeparatedByString:@"\"],[\""]) {
    [ary addObject:[obj componentsSeparatedByString:@"\", \""]];
  }
  return ary;
}
- (void) call:(NSArray*)argv {
  if (0==[argv count]) {
    return;
  }
  id funs = [[self mappings] find_funs:syms];
  if (0==[funs count]) {
    return;
  }
  id str = [argv componentsJoinedByString:@" "];
  if ([str hasPrefix:KEYWORD_FUNCTION]) {
    printf("%s", [[funs componentsJoinedByString:@", "] UTF8String]);
  } else if ([str hasPrefix:KEYWORD_INVERSE_FUNCTION]) {
    funs = [[[self mappings] swap_pair] find_funs:syms];
    if ([funs count] > 0) { 
      printf("%s", [[funs componentsJoinedByString:@", "] UTF8String]);
    } else {
      printf("%s", [KEYWORD_NO UTF8String]);
    }
  } else if ([str hasPrefix:KEYWORD_CODE]) {
    id ex = [[[self mappings] objectAtIndex:0] objectAtIndex:0];
    NSMutableArray* ary = [NSMutableArray array];
    for(id fun in funs) {
      [ary addObject:[NSString stringWithFormat:@"[@\"%@\" %@]", ex, fun]];
    }
    printf("%s", [[ary componentsJoinedByString:@"\n"] UTF8String]);
  } else {
    id value = [str performSelector:NSSelectorFromString([funs objectAtIndex:0])];
    printf("%s", [value UTF8String]);
  }
}
@end

@implementation NSArray (Ext)
- (BOOL) all:(id)sym {
  for(id obj in self) {
    id a = [obj objectAtIndex:0];
    id b = [obj objectAtIndex:1];
    if (! [[a performSelector:NSSelectorFromString(sym)] isEqualTo:b]) {
      return false;
    }
  }
  return true;
}
- (NSArray*) find_funs:(id)syms {
  NSMutableArray* ary = [NSMutableArray array];
  for(id sym in syms) {
    if ([self all:sym]) {
      [ary addObject:sym];
    }
  }
  return ary;
}
- (NSArray*) swap_pair {
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in self) {
    id a = [obj objectAtIndex:0];
    id b = [obj objectAtIndex:1];
    [ary addObject:[NSArray arrayWithObjects:b, a, nil]];
  }
  return ary;
}
@end

void printString(id str) {
  id order = [NSArray arrayWithObjects:@"uppercaseString", nil];
  id ret = [NSString stringWithFormat:@"{"\
    @"\"%@\" => \"%@\","\
    @"\"uppercaseString\" => \"%@\" "\
    @"}",
      KEYWORD_ORDER,
      [order componentsJoinedByString:@" "],
      [str uppercaseString]];
  printf([ret  UTF8String]);
}
