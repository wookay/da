//
//  Inspect.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Inspect.h"
#import "NSStringExt.h"
#import "NSNumberExt.h"
#import "Logger.h"
#import "objc/runtime.h"


@implementation NSObject (Inspect)
-(id) inspect {
	NSFormatterToInspect* formatter = [[NSFormatterToInspect alloc] init];
	NSString* str = [formatter stringForObjectValue:self];
	[formatter release];
	return str;
}
@end

@implementation NSFormatterToInspect
- (NSString *)stringForObjectValue:(id)anObject {
	if ([anObject isKindOfClass:[NSArray class]]) {
		NSMutableArray* ary = [NSMutableArray array];
		for (id obj in (NSArray*)anObject) {
			[ary addObject:SWF(@"%@", [obj inspect])];
		}
		return SWF(@"[%@]", [ary componentsJoinedByString:@", "]);
	} else if ([anObject isKindOfClass:[NSDictionary class]]) {
		NSMutableArray* ary = [NSMutableArray array];
		for (id key in anObject) {
			[ary addObject:[NSString stringWithFormat:@"%@ = %@", key, [anObject objectForKey:key]]];
		}
		return SWF(@"{%@}", [ary componentsJoinedByString:@", "]);
	} else if ([anObject isKindOfClass:[NSString class]]) {
		return SWF(@"%@", anObject);
	} else if ([anObject isKindOfClass:[NSValue class]]) {
		const char* aTypeDescription = [(NSValue*)anObject objCType];
		switch (*aTypeDescription) {
			case _C_FLT: {
					float value = [anObject doubleValue];
					if ([[anObject floor_down] doubleValue] == value) {
						return SWF(@"%.1f", value);						
					} else {
						return SWF(@"%f", value);												
					}
				}
				break;
			default:
				break;
		}
	}
	return SWF(@"%@", anObject);
}
@end
