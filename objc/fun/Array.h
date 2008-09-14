// Array.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSArray ( Array )

- (id) join ;
- (id) to_s ;
- (id) join:(id)sep ;
- (id) first ;
- (id) last ;
- (id) reverse ;
- (int) size ;

@end



@interface NSMutableArray ( Array )

- (id) push:(id)obj ;
- (id) pop ;

@end
