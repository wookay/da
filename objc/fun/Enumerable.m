// Enumerable.m
//                           wookay.noh at gmail.com

#import "Enumerable.h"
#import "Numeric.h"

@implementation NSArray ( Enumerable )

- (id) sum {
  return [self reduce:@"+"]; 
}

- (id) reduce:(NSString*)op {

  if ([self count] == 0) {
    return nil;
  }

  id first = [self objectAtIndex:0];
  if ([self count] == 1) {
    return first;
  }

  id ret = [first to_decimal];
  id rest = [self subarrayWithRange:NSMakeRange(1, [self count] - 1)];
  NSDictionary* opTable = [NSDictionary dictionaryWithObjectsAndKeys:
    @"Adding", @"+",
    @"Subtracting", @"-", 
    @"MultiplyingBy", @"*", 
    @"DividingBy", @"/", 
    @"ModuloBy", @"%",
    nil];
  for (id obj in rest) {
    id operation = [NSString stringWithFormat:@"decimalNumberBy%@:",
                                              [opTable valueForKey:op]];
    ret = [ret performSelector:NSSelectorFromString(operation)
               withObject:[obj to_decimal]];
  }
  return ret;
}

@end
