// gp.m
//                           wookay.noh at gmail.com

#include <Foundation/Foundation.h>
#include "pari_gp_ext.h"

@interface GP : NSObject

- (id) init ;
- (NSString*) eval:(NSString*) str ;
- (NSString*) polinterpolate:(NSString*)sxa ;

@end
