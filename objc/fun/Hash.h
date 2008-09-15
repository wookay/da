// Hash.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSMutableDictionary ( Hash )

- (id) to_s ;
- (id) store:(id)key v:(id)obj ;
- (id) fetch:(id)key ;
- (bool) empty:(char)question ;

@end
