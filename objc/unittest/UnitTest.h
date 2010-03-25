//
//  UnitTest.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inspect.h"
#import "NSNumberExt.h"
#import "NSStringExt.h"
#import "Logger.h"

@interface TestSuite : NSObject
@end

#define assert_equal(expected, got) \
 do { \
	__typeof__(expected) __expected = (expected); \
	__typeof__(got) __got = (got); \
	NSValue* expected_encoded = [NSValue valueWithValue:&__expected withObjCType: @encode(__typeof__(expected))]; \
	NSValue* got_encoded = [NSValue valueWithValue:&__got withObjCType: @encode(__typeof__(got))]; \
	[UnitTest assert:got_encoded equals:expected_encoded inFile:[NSString stringWithUTF8String:__FILE__] atLine:__LINE__]; \
} while(0)


@interface UnitTest : NSObject
+(void) setup ;
+(void) report ;
+(void) assert:(id)got equals:(id)expected inFile:(NSString*)file atLine:(int)line ;
+(id) target:(NSString*)targetClassString ;
+(void) run_all_tests ;
@end

@interface NSObject (UnitTest)
-(void) run_test:(SEL)sel ;
-(void) run_tests ;
-(NSArray*) methods ;
@end

@interface NSValue (Ext)
+ valueWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription ;
@end
