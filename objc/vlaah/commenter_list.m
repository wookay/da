// commenter_list.m
//                           wookay.noh at gmail.com

#import "commenter_list.h"
#import "person.h"

@implementation CommenterList 

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
  return 0;
}

- (id) all {
  return [self map_people:@"//person"];
}

- (NSArray*) plus {
  return [self map_people:@"//plus/person"];
}

- (NSArray*) minus {
  return [self map_people:@"//minus/person"];
}

- (NSArray*) map_people:(id)xpath {
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in [self items:xpath]) {
    Person* person = [[Person alloc] init];
    person.raw_data = [obj XMLString];
    [ary addObject:person];
  }
  return ary;
}

@end
