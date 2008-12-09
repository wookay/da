// pol.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface Pol : NSObject {
  NSArray* syms;
  id path;
}
- (id) new:(NSString*)_syms path:(id)_path;
- (id) mappings ;
- (void) call:(NSArray*)argv ;
@end

@interface NSArray (Ext)
- (BOOL) all:(id)sym ;
- (NSArray*) find_funs:(id)syms ;
- (NSArray*) swap_pair ;
@end
