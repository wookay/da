// Array.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import "Stack.h"

@interface ArrayProxy: NSProxy {
  NSArray* array;
}
- (id) initWithArray:(NSArray*)ary ;

@end



@interface NSArray ( Array )

- (id) join ;
- (id) to_s ;
- (id) join:(id)sep ;
- (id) first ;
- (id) last ;
- (id) reverse ;
- (int) size ;
- (bool) empty:(char)question ;
- (id) map ;
- (NSArray*) map:(SEL)selector ;

@end



@interface NSMutableArray ( Array ) <Stack>

//- (id) push:(id)obj ;
//- (id) pop ;

@end
