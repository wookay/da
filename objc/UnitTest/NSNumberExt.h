//
//  NSNumberExt.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NUM(num) [NSNumber numberWithDouble:num]


@interface NSNumber (Ext)

-(NSNumber*) plus:(NSNumber*) num ;
-(NSNumber*) divide:(NSNumber*) num ;

@end




@interface NSNumber (MathFunctions)
-(id) round_up ;
-(id) ceiling ;
-(id) floor_down ;
@end