// unit.m
//                           wookay.noh at gmail.com

#import "unit.h"
#import <Foundation/NSXMLElement.h>
#import <Foundation/NSString.h>
#import <objc/runtime.h>

@interface NSArray ( valueForKey )
- (id) valueForKey:(id)key ;
@end

@implementation NSArray ( valueForKey )
- (id) valueForKey:(id)key {
  for(id attr in self) {
    if ([key isEqualToString:[attr name]]) {
      return [attr stringValue];
    }
  }
  return nil;
}
@end



@implementation Unit

@synthesize total;
@synthesize plus;
@synthesize minus;

- (id) initWithElement:(id)element {
  id attrs = [element attributes];
  self.total = [[attrs valueForKey:@"total"] floatValue];
  self.plus = [[attrs valueForKey:@"plus"] floatValue];
  self.minus = [[attrs valueForKey:@"minus"] floatValue];
  return self;
}

@end
