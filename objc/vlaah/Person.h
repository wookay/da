// person.h
//                           wookay.noh at gmail.com

#import "topic.h"

@interface Person : Topic {
}

- (id) nick ;
- (id) picture_url ;
- (NSArray*) favorites ;
- (NSArray*) friends ;
- (NSArray*) feedback ;

@end
