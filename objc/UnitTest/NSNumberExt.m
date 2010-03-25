//
//  NSNumberExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSNumberExt.h"
#import "Logger.h"

@implementation NSNumber (Ext)

-(NSNumber*) plus:(NSNumber*) num {
	return [NSNumber numberWithInt:[self intValue] + [num intValue]];
}

-(NSNumber*) divide:(NSNumber*) num {
	return [NSNumber numberWithFloat:[self floatValue] / [num floatValue]];
}

@end




@implementation NSNumber (MathFunctions)
-(id) round_up {
	double value = round([self doubleValue]);
	return [NSNumber numberWithDouble:value];
}
-(id) ceiling {
	double value = ceil([self doubleValue]);
	return [NSNumber numberWithDouble:value];
}
-(id) floor_down {
	double value = floor([self doubleValue]);
	return [NSNumber numberWithFloat:value];
}
@end
