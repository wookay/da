// comment_list.h
//                           wookay.noh at gmail.com

#import "comment_list.h"

@implementation CommentList 

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
  return 0;
}

- (NSArray*) all {
  NSMutableArray* ary = [NSMutableArray array];
  for(id obj in [self items:@"//comment"]) {
    Comment* comment = [[Comment alloc] init];
    comment.raw_data = [obj XMLString];
    [ary addObject:comment];
  }
  return ary;
}

- (Comment*) first {
  NSArray* ary = [self all];
  if ([ary count] > 0) {
    return [ary objectAtIndex:0];
  } else {
    return nil;
  }
}

- (Comment*) last {
  id ary = [self all];
  return [ary lastObject];
}

- (int) length {
  id car = [self item:@"//@cardinality"];
  if (car) {
    return [car intValue];
  } else {
    return 0;
  }
}

@end
