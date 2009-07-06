// String.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSString ( String )

- (int) to_i ;
- (float) to_f ;
- (id) to_range ;
- (id) split ;
- (id) split:(id)sep ;
- (bool) empty:(char)question ;
- (id) concat:(id)obj ;
- (id) gsub:(id)pattern to:(id)replacement ;
- (BOOL) included:(NSString*)aString ;

@end
