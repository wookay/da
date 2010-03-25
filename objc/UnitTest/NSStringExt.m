//
//  NSStringExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSStringExt.h"
#import "NSNumberExt.h"

NSString* SWF(NSString* format, ...) {
	va_list args;
	va_start(args, format);
	NSString* alloc_str = [[NSString alloc] initWithFormat:format arguments:args];
	va_end(args);
	NSString* ret = [NSString stringWithFormat:@"%@", alloc_str];
	[alloc_str release];
	return ret;
}

NSArray* _w(NSString* str) {
	return [str componentsSeparatedByString:SPACE];
}

@implementation NSString (Ext)

-(unichar) to_unichar {
	return [self characterAtIndex:0];
}

+(NSString*) stringWithCharacter:(unichar) ch {
	return [NSString stringWithFormat:@"%C", ch];
}

-(NSString*) stringAtIndex:(int)idx {
	return [self substringWithRange:NSMakeRange(idx, 1)];
}

-(NSString*) last {
	if (self.length > 0) {
		return [self stringAtIndex:self.length - 1];
	} else {
		return EMPTY_STRING;
	}
}

@end