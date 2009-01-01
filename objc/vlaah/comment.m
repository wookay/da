// comment.m
//                           wookay.noh at gmail.com

#import "comment.h"

@implementation Comment

+ (id) find:(id)name {
  Comment* comment = [[Comment alloc] init];
  comment.name = name;
  [comment raw_data:name];
  return comment;
}

- (id) body {
  return [self item:@"//body/*"];
}

@end
