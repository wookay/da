// topic.m
//                           wookay.noh at gmail.com

#import "topic.h"
#import "person.h"
#import "comment.h"
#import "comment_list.h"
#import "commenter_list.h"
#import "unit.h"
#import <objc/runtime.h>

@implementation Topic

@synthesize name;

+ (id) find:(id)name {
  if ([name hasPrefix:@"~"]) {
    return [Person find:name];
  } else if ([name hasPrefix:@"?"]) {
    return [Comment find:name];
  } else {
    Topic* topic = [[Topic alloc] init];
    topic.name = name;
    [topic raw_data:name];
    return topic;
  }
}

- (id) normalized_name {
  return [self item:@"//@normalized-name"];
}

- (id) usual_name {
  return [self item:@"//@usual-name"];
}

- (Unit*) degree {
  return [[Unit alloc] initWithElement:[self element:@"//degree"]];
}

- (Unit*) people {
  return [[Unit alloc] initWithElement:[self element:@"//people"]];
}

- (Unit*) percent {
  return [[Unit alloc] initWithElement:[self element:@"//percent"]];
}

- (id) comments {
  id comment_list = [[CommentList alloc] init];
  [comment_list raw_data:[self.name stringByAppendingString:@"/comments"]];
  return comment_list;
}

- (id) commenters {
  id commenter_list = [[CommenterList alloc] init];
  [commenter_list raw_data:[self.name stringByAppendingString:@"/commenters"]];
  return commenter_list;
}

@end
