//
//  NSStringExt.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define EMPTY_STRING     @""
#define SPACE            @" "
#define LF               @"\n"
#define AMP              @"&"
#define EQUAL            @"="
#define COLON            @":"
#define COMMA            @","
#define DOT              @"."
#define STAR             @"*"
#define PLUS             @"+"
#define PIPE             @"|"
#define QUESTION_MARK    @"?"
#define EXCLAMATION_MARK @"!"
#define	LESS_THAN        @"<"
#define	GREATER_THAN     @">"
#define SQUARE_BRACKET   @"[]"
#define OPENING_SQUARE_BRACKET   @"["
#define CLOSING_SQUARE_BRACKET   @"]"

#define CHAR_MINUS       '-'

NSString* SWF(NSString* format, ...) ;
NSArray* _w(NSString* str) ;

@interface NSString (Ext)

-(unichar) to_unichar ;
+(NSString*) stringWithCharacter:(unichar) ch ;
-(NSString*) stringAtIndex:(int)idx ;
-(NSString*) last ;

@end

