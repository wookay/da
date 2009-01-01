// person.m
//                           wookay.noh at gmail.com

#import "person.h"
#import "comment_list.h"

@implementation Person

+ (id) find:(id)name {
  Person* person = [[Person alloc] init];
  person.name = name;
  [person raw_data:name];
  return person;
}

- (id) nick {
  return [self item:@"//@nick"];
}

- (id) picture_url {
  return [self item:@"//@picture-url"];
}

- (NSArray*) favorites {
  id comment_list = [[CommentList alloc] init];
  [comment_list raw_data:[self.name stringByAppendingString:@"/favorites"]];
  return comment_list;
}

- (NSArray*) friends {
  return [self raw_data:
    [self.normalized_name stringByAppendingString:@"/friends"]];
}

- (NSArray*) feedback {
  id comment_list = [[CommentList alloc] init];
  [comment_list raw_data:[self.name stringByAppendingString:@"/feedback"]];
  return comment_list;
}

@end
