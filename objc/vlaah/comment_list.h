// comment_list.h
//                           wookay.noh at gmail.com

#import "base.h"
#import "comment.h"

@interface CommentList : Base <NSFastEnumeration> {
}

- (int) length ;
- (NSArray*) all ;
- (Comment*) first ;
- (Comment*) last ;

@end
